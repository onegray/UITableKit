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
	TKCellView* cellView;
	NSString* cellId;
	CellCache* next;
}
+(void) initHashTable;
@end

@implementation CellCache
#define HASH_TABLE_SIZE 31
static CellCache** hashTable = NULL;

+(void) initHashTable
{
	hashTable = hashTable ? hashTable : (CellCache**)calloc(HASH_TABLE_SIZE, sizeof(void*));
}

+(CellCache*) cacheForSelector:(SEL)sel param:(int)param
{
	int ind = ((int)sel + param) % HASH_TABLE_SIZE;
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
	root->cellId = [[NSString alloc] initWithFormat:@"%s%d", sel_getName(sel), param];
	root->keySel = sel;
	root->keyParam = param;
	root->next = hashTable[ind];
	hashTable[ind] = root;
	
	return root;
}

@end


@interface TKThemeCacheProxy()
-(id) initWithTheme:(id<TKThemeProtocol>)theme forTableView:(UITableView*) tableView;
@property (nonatomic, assign) UITableView* tableView;
@property (nonatomic, retain) id<TKThemeProtocol> themeImpl;
@end

@implementation TKThemeCacheProxy
@synthesize tableView, themeImpl;

static TKDefaultTheme* defaultThemeImpl = nil;

-(id) initWithTheme:(id<TKThemeProtocol>)theme forTableView:(UITableView*)aTableView
{
	self.themeImpl = theme;
	self.tableView = aTableView;
	return self;
}

-(void) dealloc
{
	[themeImpl release];
	[super dealloc];
}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)selector
{
	NSMethodSignature* signature = [(id)themeImpl methodSignatureForSelector:selector];
	if(!signature)
	{
		defaultThemeImpl = defaultThemeImpl ? defaultThemeImpl : [[TKDefaultTheme alloc] init];
		signature = [defaultThemeImpl methodSignatureForSelector:selector];
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
	
	CellCache* cache = [CellCache cacheForSelector:invocation.selector param:param];
	TKCellView* cellView = (TKCellView*)[tableView dequeueReusableCellWithIdentifier:cache->cellId];
	if(cellView) 
	{
		[invocation setReturnValue:&cellView];
	}
	else if(cache->cellView)
	{
		[invocation setReturnValue:&(cache->cellView)];
		[cache->cellView autorelease];
		cache->cellView = nil;
	}
	else
	{
		id target = [themeImpl respondsToSelector:invocation.selector] ? themeImpl : defaultThemeImpl;
		[invocation invokeWithTarget:target];
		[invocation getReturnValue:&cellView];
		[cellView setReuseIdentifier:cache->cellId];
	}
}

-(void) fillCache:(CellCache*)cache invokeSelector:(SEL)selector
{
	TKCellView* cellView = nil;
	id target = [themeImpl respondsToSelector:selector] ? themeImpl : defaultThemeImpl;
	NSMethodSignature* ms = [target methodSignatureForSelector:selector];
	
	if([ms numberOfArguments]==2)
	{
		cellView = [target performSelector:selector];
	}
	else
	{
		NSAssert([ms numberOfArguments]==3, @"Invalid param num for selector %s", sel_getName(selector));
		NSAssert([ms getArgumentTypeAtIndex:2][0]=='i', @"TKThemeCacheProxy supports only int params");
		
		NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:ms];
		[invocation setSelector:selector];
		[invocation invokeWithTarget:target];
		[invocation getReturnValue:&cellView];
	}
	
	[cellView setReuseIdentifier:cache->cellId];
	cache->cellView = [cellView retain];
	cache->class = [cellView class];
}

-(Class) cellClassForSelector:(SEL)selector style:(int)style
{
	CellCache* cache = [CellCache cacheForSelector:selector param:style];
	if(!cache->class) 
	{
		[self fillCache:cache invokeSelector:selector];
	}
	return cache->class;
}

-(TKCellView*) cachedCellForSelector:(SEL)selector style:(int)style
{
	CellCache* cache = [CellCache cacheForSelector:selector param:style];
	if(!cache->cellView)
	{
		[self fillCache:cache invokeSelector:selector];
	}
	return cache->cellView;
}

@end



static NSMutableDictionary* themeDict = nil;
static TKThemeCacheProxy* cachedTheme = nil;

@implementation UITableView(theme)

-(id) theme
{
	if(cachedTheme.tableView!=self)
	{
		cachedTheme = [themeDict objectForKey:[NSValue valueWithPointer:self]];
		if(!cachedTheme)
		{
			NSLog(@"No one theme was applied to %@, applying default theme", self);
			defaultThemeImpl = defaultThemeImpl ? defaultThemeImpl : [[TKDefaultTheme alloc] init];
			[self applyTheme:defaultThemeImpl];
		}
	}
	return cachedTheme;
}


-(void) applyTheme:(id)themeImpl
{
	TKThemeCacheProxy* theme = [[[TKThemeCacheProxy alloc] initWithTheme:themeImpl forTableView:self] autorelease];
	
	if(!themeDict)
	{
		themeDict = [[NSMutableDictionary alloc] initWithCapacity:1];
		[CellCache initHashTable];
	}
	[themeDict setObject:theme forKey:[NSValue valueWithPointer:self]];
	cachedTheme = theme;
	
	// Overloading dealloc from category
	if( class_getInstanceMethod([self class], @selector(original_dealloc)) == NULL ) 
	{
		Method deallocMethod = class_getInstanceMethod([self class], @selector(dealloc));
		class_addMethod([self class], @selector(original_dealloc), method_getImplementation(deallocMethod), method_getTypeEncoding(deallocMethod));
		
		Method overloadedDeallocMethod = class_getInstanceMethod([self class], @selector(overloaded_dealloc));
		method_exchangeImplementations(deallocMethod, overloadedDeallocMethod);
	}
}

-(void) overloaded_dealloc
{
	if(cachedTheme.tableView==self)
	{
		cachedTheme = nil;
	}
	[themeDict removeObjectForKey:[NSValue valueWithPointer:self]];
	
	[self performSelector:@selector(original_dealloc)];
}

@end




