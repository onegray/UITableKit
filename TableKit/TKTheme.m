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


static TKDefaultTheme* defaultThemeImpl = nil;

@interface TKThemeCacheProxy : NSProxy
{
	UITableView* tableView;
	id themeImpl;
}

-(id) initWithTheme:(id)theme forTableView:(UITableView*) tableView;

@property (nonatomic, assign) UITableView* tableView;
@property (nonatomic, retain) id themeImpl;

@end



// String pool to prevent numerous allocations
@interface SelectorCachedString : NSObject
{ 
@public
	NSString* string;
	SEL key;
	SelectorCachedString* next;
}
+(void) initHashTable;
+(NSString*) stringForSelector:(SEL)key;
@end

@implementation SelectorCachedString
#define HASH_TABLE_SIZE 31
static SelectorCachedString** hashTable = NULL;

+(void) initHashTable
{
	hashTable = hashTable ? hashTable : (SelectorCachedString**)calloc(HASH_TABLE_SIZE, sizeof(void*));
}

+(NSString*) stringForSelector:(SEL)key
{
	int ind = (int)key % HASH_TABLE_SIZE;
	SelectorCachedString* root = hashTable[ind];
	while(root)
	{
		if(root->key==key)
		{
			return root->string;
		}
		root = root->next;
	}

	root = [[SelectorCachedString alloc] init];
	root->string = [NSStringFromSelector(key) retain];
	root->key = key;
	root->next = hashTable[ind];
	hashTable[ind] = root;
	
	return root->string;
}
@end



@implementation TKThemeCacheProxy
@synthesize tableView, themeImpl;

-(id) initWithTheme:(id)theme forTableView:(UITableView*)aTableView
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
	NSString* reuseId = [SelectorCachedString stringForSelector:invocation.selector];
	TKCellView* cellView = (TKCellView*)[tableView dequeueReusableCellWithIdentifier:reuseId];
	if(cellView) 
	{
		[invocation setReturnValue:&cellView];
	}
	else
	{
		id target = [themeImpl respondsToSelector:invocation.selector] ? themeImpl : defaultThemeImpl;
		[invocation invokeWithTarget:target];
		[invocation getReturnValue:&cellView];
		[cellView setReuseIdentifier:reuseId];
	}
}

-(TKGeneralCellView*) generalCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	static NSString* reuseIds[] = {@"cellDefault", @"cellValue1", @"cellValue2", @"cellSubtitle"};
	TKGeneralCellView* cellView = (TKGeneralCellView*)[tableView dequeueReusableCellWithIdentifier:reuseIds[cellStyle]];
	if(!cellView)
	{
		id target = [themeImpl respondsToSelector:@selector(generalCellViewWithStyle:)] ? themeImpl : defaultThemeImpl;
		cellView = [target generalCellViewWithStyle:cellStyle];
		[cellView setReuseIdentifier:reuseIds[cellStyle]];
	}
	return cellView;
}

-(TKGeneralCellView*) actionCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	static NSString* reuseIds[] = {@"actionDefault", @"actionValue1", @"actionValue2", @"actionSubtitle"};
	TKGeneralCellView* cellView = (TKGeneralCellView*)[tableView dequeueReusableCellWithIdentifier:reuseIds[cellStyle]];
	if(!cellView)
	{
		id target = [themeImpl respondsToSelector:@selector(actionCellViewWithStyle:)] ? themeImpl : defaultThemeImpl;
		cellView = [target actionCellViewWithStyle:cellStyle];
		[cellView setReuseIdentifier:reuseIds[cellStyle]];
	}
	return cellView;
}

-(TKSwitchCellView*) switchCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	static NSString* reuseIds[] = {@"switchDefault", @"switchValue1", @"switchValue2", @"switchSubtitle"};
	TKSwitchCellView* cellView = (TKSwitchCellView*)[tableView dequeueReusableCellWithIdentifier:reuseIds[cellStyle]];
	if(!cellView)
	{
		id target = [themeImpl respondsToSelector:@selector(switchCellViewWithStyle:)] ? themeImpl : defaultThemeImpl;
		cellView = [target switchCellViewWithStyle:cellStyle];
		[cellView setReuseIdentifier:reuseIds[cellStyle]];
	}
	return cellView;
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
		[SelectorCachedString initHashTable];
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




