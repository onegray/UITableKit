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

@interface TKTheme : NSObject <TKThemeProtocol>
{
	UITableView* tableView;
	id<TKThemeProtocol> themeImpl;
}

@property (nonatomic, assign) UITableView* tableView;
@property (nonatomic, retain) id<TKThemeProtocol> themeImpl;

@end


@implementation TKTheme
@synthesize tableView, themeImpl;

-(void) dealloc
{
	[themeImpl release];
	[super dealloc];
}

+(TKTheme*) themeForTableView:(UITableView*)tableView
{
	static TKTheme* instance = nil;
	if(!instance) 
	{
		instance = [[TKTheme alloc] init];
	}
	return instance;
}

-(TKStaticCellView*) staticCellViewWithReuseId:(NSString*)reuseId
{
	TKStaticCellView* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(!cellView)
	{
        cellView = [themeImpl staticCellViewWithReuseId:reuseId];
    }
	return cellView;
}

-(TKActionCellView*) actionCellViewWithReuseId:(NSString*)reuseId
{
	TKActionCellView* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [themeImpl actionCellViewWithReuseId:reuseId];
	}
	return cellView;
}

-(TKTextFieldCellView*) textFieldCellViewWithReuseId:(NSString*)reuseId
{
	TKTextFieldCellView* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [themeImpl textFieldCellViewWithReuseId:reuseId];
	}
	return cellView;
}

-(TKSwitchCellView*) switchCellViewWithReuseId:(NSString*)reuseId
{
	TKSwitchCellView* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [themeImpl switchCellViewWithReuseId:reuseId];
	}
	return cellView;
}

-(TKTextViewCellView*) textViewCellViewWithReuseId:(NSString*)reuseId
{
	TKTextViewCellView* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [themeImpl textViewCellViewWithReuseId:reuseId];
	}
	return cellView;
}


@end



static NSMutableArray* themeList = nil;

@implementation UITableView(theme)

-(id<TKThemeProtocol>) theme
{
	if( [themeList count]>0 )
	{
		TKTheme* th = [themeList objectAtIndex:0];
		if(th.tableView==self)
		{
			return th;
		}

		for(TKTheme* th in themeList)
		{
			if(th.tableView==self)
			{
				[th retain];
				[themeList removeObject:th];
				[themeList insertObject:th atIndex:0];
				[th release];
				return th;
			}		
		}
	}
	
	NSLog(@"No one theme was applied to %@, applying default theme", self);

	id defaultTheme = [[[TKDefaultTheme alloc] init] autorelease];
	[self applyTheme:defaultTheme];
	
	return [self theme];
}

-(void) applyTheme:(id<TKThemeProtocol>)themeImpl
{
	TKTheme* theme = [[[TKTheme alloc] init] autorelease];
	theme.themeImpl = themeImpl;
	theme.tableView = self;	
	
	if(!themeList)
	{
		themeList = [[NSMutableArray alloc] initWithCapacity:1];
		[themeList addObject:theme];
	}
	else
	{
		for(TKTheme* th in themeList)
		{
			if(th.tableView==self)
			{
				[themeList removeObject:th];
				break;
			}
		}
		[themeList insertObject:theme atIndex:0];
	}
	
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
	for(TKTheme* th in themeList)
	{
		if(th.tableView==self)
		{
			[themeList removeObject:th];
			break;
		}
	}
	
	[self performSelector:@selector(original_dealloc)];
}

@end




