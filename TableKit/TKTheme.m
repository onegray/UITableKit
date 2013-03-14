//
//  TKTheme.m
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 Sergey Nikitenko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TKTheme.h"
#import "TKCellView.h"
#import "TKDefaultTheme.h"

#import <objc/runtime.h>


@interface CellCache : NSObject
{ 
@public
	SEL keySel;
	int keyParam;
	Class class;
	__strong TKCellView* cellView;
	__strong NSString* cellId;
	__strong CellCache* next;
}
@end

@implementation CellCache

- (void)dealloc
{
	//NSLog(@"dealloc %@", self);
}
@end


#define HASH_TABLE_SIZE 31

static __unsafe_unretained TKThemeCacheProxy* cachedTheme = nil;

@interface TKThemeCacheProxy()
{
@public
	__unsafe_unretained UITableView* tableView;
	__strong id<TKThemeProtocol> themeImpl;
	__strong CellCache* hashTable[HASH_TABLE_SIZE];
}
-(id) initWithTheme:(id<TKThemeProtocol>)theme forTableView:(UITableView*) tableView;
@end

@implementation TKThemeCacheProxy
static __strong TKDefaultTheme* builtinDefaultThemeImpl = nil;
static __strong id<TKThemeProtocol> userDefaultThemeImpl = nil;

-(id) initWithTheme:(id<TKThemeProtocol>)theme forTableView:(UITableView*)aTableView
{
	themeImpl = theme;
	tableView = aTableView;
	memset(hashTable, 0, sizeof(hashTable));
	return self;
}

-(void) dealloc
{
	if(cachedTheme==self) {
		cachedTheme = nil;
	}
}

-(CellCache*) cacheForSelector:(SEL)sel param:(int)param
{
	int ind = ((int)(void*)sel + param) % HASH_TABLE_SIZE;
	CellCache* root = hashTable[ind];
	while(root)
	{
		if(root->keySel==sel && root->keyParam==param)
		{
			return root;
		}
		root = root->next;
	}
	
	root = [[CellCache alloc] init];
	root->cellId = [[NSString alloc] initWithFormat:@"%s.%s%d",
					class_getName([themeImpl class]), sel_getName(sel), param];
	root->keySel = sel;
	root->keyParam = param;
	root->next = hashTable[ind];
	hashTable[ind] = root;
	
	return root;
}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)selector
{
	NSMethodSignature* signature = [(id)themeImpl methodSignatureForSelector:selector];
	if(!signature)
	{
		if(!builtinDefaultThemeImpl) {
			builtinDefaultThemeImpl = [[TKDefaultTheme alloc] init];
		}
		signature = [(id)builtinDefaultThemeImpl methodSignatureForSelector:selector];
		NSAssert(signature!=nil, @"Applied theme %@ does not support method '%s'", themeImpl, sel_getName(selector));
	}
	return signature;
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
	int param = 0;
	NSMethodSignature* ms = invocation.methodSignature;
	if([ms numberOfArguments]>2)
	{
		NSAssert([ms numberOfArguments]==3, @"TKThemeCacheProxy supports only 1 param");
		NSAssert([ms getArgumentTypeAtIndex:2][0]==@encode(int)[0], @"TKThemeCacheProxy supports only int params");
		[invocation getArgument:&param atIndex:2];
	}
	
	CellCache* cache = [self cacheForSelector:invocation.selector param:param];
	__unsafe_unretained TKCellView* cellView = (TKCellView*)[tableView dequeueReusableCellWithIdentifier:cache->cellId];
	if(cellView) 
	{
		[invocation setReturnValue:&cellView];
	}
	else if(cache->cellView)
	{
		[invocation setReturnValue:&(cache->cellView)];
		cache->cellView = nil;
	}
	else
	{
		id target = [themeImpl respondsToSelector:invocation.selector] ? themeImpl : builtinDefaultThemeImpl;
		[invocation invokeWithTarget:target];
		[invocation getReturnValue:&cellView];
		[cellView setReuseIdentifier:cache->cellId];
	}
}


-(void) fillCache:(CellCache*)cache invokeSelector:(SEL)selector style:(int)style
{
	__unsafe_unretained TKCellView* cellView = nil;
	id target = [themeImpl respondsToSelector:selector] ? themeImpl : builtinDefaultThemeImpl;
	NSMethodSignature* ms = [target methodSignatureForSelector:selector];
	NSAssert(ms!=nil, @"Applied theme %@ does not support method '%s'", themeImpl, sel_getName(selector));
	
	if([ms numberOfArguments]==2)
	{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		cellView = [target performSelector:selector];
#pragma clang diagnostic pop
	}
	else
	{
		NSAssert([ms numberOfArguments]==3, @"Invalid param num for selector %s", sel_getName(selector));
		NSAssert([ms getArgumentTypeAtIndex:2][0]==@encode(int)[0], @"TKThemeCacheProxy supports only int params");
		
		NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:ms];
		[invocation setSelector:selector];
		[invocation setArgument:&style atIndex:2];
		[invocation invokeWithTarget:target];
		[invocation getReturnValue:&cellView];
	}
	
	[cellView setReuseIdentifier:cache->cellId];
	cache->cellView = cellView;
	cache->class = [cellView class];
}

-(Class) cellClassForSelector:(SEL)selector style:(int)style
{
	CellCache* cache = [self cacheForSelector:selector param:style];
	if(!cache->class) 
	{
		[self fillCache:cache invokeSelector:selector style:style];
	}
	return cache->class;
}

-(TKCellView*) cachedCellForSelector:(SEL)selector style:(int)style
{
	CellCache* cache = [self cacheForSelector:selector param:style];
	if(!cache->cellView)
	{
		[self fillCache:cache invokeSelector:selector style:style];
	}
	return cache->cellView;
}

@end



@implementation UITableView(theme)
static char TV_THEME_KEY;

+(void) setDefaultTheme:(id<TKThemeProtocol>)theme
{
	userDefaultThemeImpl = theme;
}

-(id) theme
{
	if(!cachedTheme || cachedTheme->tableView!=self)
	{
		cachedTheme = objc_getAssociatedObject(self, &TV_THEME_KEY);
		if(!cachedTheme)
		{
			if(!userDefaultThemeImpl) {
				NSLog(@"No default theme was found. Setting TKDefaultTheme as default theme");
				if(!builtinDefaultThemeImpl) {
					builtinDefaultThemeImpl = [[TKDefaultTheme alloc] init];
				}
				[UITableView setDefaultTheme:builtinDefaultThemeImpl];
			}
			[self applyTheme:userDefaultThemeImpl];
		}
	}
	return cachedTheme;
}

-(void) applyTheme:(id)themeImpl
{
	TKThemeCacheProxy* themeProxy = [[TKThemeCacheProxy alloc] initWithTheme:themeImpl forTableView:self];
	objc_setAssociatedObject(self, &TV_THEME_KEY, themeProxy, OBJC_ASSOCIATION_RETAIN);
	cachedTheme = themeProxy;

	if([themeImpl respondsToSelector:@selector(configureTableView:)]) {
		[themeImpl configureTableView:self];
	}
}

@end




