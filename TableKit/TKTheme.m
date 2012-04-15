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
#import <objc/runtime.h>

#import "TKDefaultTheme.h"

@interface TKThemeCacheProxy : NSProxy
{
	UITableView* tableView;
	id<TKThemeProtocol> themeImpl;
}

-(id) initWithTheme:(id)theme forTableView:(UITableView*) tableView;

@property (nonatomic, assign) UITableView* tableView;
@property (nonatomic, retain) id<TKThemeProtocol> themeImpl;

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
	return [(id)themeImpl methodSignatureForSelector:selector];
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
	NSString* reuseId = NSStringFromSelector(invocation.selector);
	TKCellView* cellView = (TKCellView*)[tableView dequeueReusableCellWithIdentifier:reuseId];
	if(cellView) 
	{
		[invocation setReturnValue:&cellView];
	}
	else
	{
		[invocation invokeWithTarget:themeImpl];
		[invocation getReturnValue:&cellView];
		[cellView setReuseIdentifier:reuseId];
	}
}

@end



static NSMutableDictionary* themeDict = nil;
static TKThemeCacheProxy* cachedTheme = nil;

@implementation UITableView(theme)

-(id<TKThemeProtocol>) theme
{
	if(cachedTheme.tableView!=self)
	{
		cachedTheme = [themeDict objectForKey:[NSValue valueWithPointer:self]];
		if(!cachedTheme)
		{
			NSLog(@"No one theme was applied to %@, applying default theme", self);
			TKDefaultTheme* defaultTheme = [[[TKDefaultTheme alloc] init] autorelease];
			[self applyTheme:defaultTheme];
		}
	}
	return (id)cachedTheme;
}


-(void) applyTheme:(id<TKThemeProtocol>)themeImpl
{
	TKThemeCacheProxy* theme = [[[TKThemeCacheProxy alloc] initWithTheme:themeImpl forTableView:self] autorelease];
	
	if(!themeDict)
	{
		themeDict = [[NSMutableDictionary alloc] initWithCapacity:1];
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




