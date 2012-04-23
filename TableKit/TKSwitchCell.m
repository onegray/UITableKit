//
//  TKSwitchCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
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

#import "TKSwitchCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"


@implementation TKSwitchCell
@synthesize state;

+(id) cellWithText:(NSString*)text state:(BOOL)state
{
    return [[[self alloc] initWithText:text state:state target:nil action:NULL] autorelease];
}

+(id) cellWithText:(NSString*)text state:(BOOL)state target:(id)target action:(SEL)selector
{
    return [[[self alloc] initWithText:text state:state target:target action:selector] autorelease];
}

+(id) cellWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText state:(BOOL)aState
{
	return [[[self alloc] initWithStyle:aCellStyle text:aText detailText:aDetailText state:aState] autorelease];
}

-(id) initWithText:(NSString*)aText state:(BOOL)aState
{
	return [self initWithText:aText state:aState target:nil action:NULL];
}

-(id) initWithText:(NSString*)aText state:(BOOL)aState target:(id)aTarget action:(SEL)selector
{
    self = [super initWithText:aText target:aTarget action:selector];
    if(self)
	{
        self.state = aState;
    }
    return self;
}

-(id) initWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText state:(BOOL)aState;
{
    self = [super initWithStyle:aCellStyle text:aText detailText:aDetailText];
    if(self)
	{
        self.state = aState;
    }
    return self;
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKSwitchCellView* cellView = (TKSwitchCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithText:text detailText:detailText state:state];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKSwitchCellView* cellView = [tableView.theme switchCellViewWithStyle:cellStyle];
	cellView.owner = self;
	[cellView.switchButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
	[cellView.switchButton addTarget:self action:@selector(onSwitchBtn:) forControlEvents:UIControlEventValueChanged];
	[cellView updateWithText:text detailText:detailText state:state];
	[self applyAttributesToCellView:cellView];
    return cellView;
}

-(void) tableViewDidSelectCell:(UITableView*)tableView
{
}

-(void) tableViewAccessoryButtonTapped:(UITableView*)tableView
{
}

-(void) onSwitchBtn:(UISwitch*)sender
{
    state = [sender isOn];
	
	NSMethodSignature* methodSignature = [target methodSignatureForSelector:action];
	if(methodSignature)
	{
		NSInvocation* inv = [NSInvocation invocationWithMethodSignature:methodSignature];
		[inv setTarget:target];
		[inv setSelector:action];
		if([methodSignature numberOfArguments]==2)
		{
			[inv invoke];
		}
		else if([methodSignature numberOfArguments]==2+1)
		{
			[inv setArgument:&state atIndex:2];
			[inv invoke];
		}
	}
}



@end
