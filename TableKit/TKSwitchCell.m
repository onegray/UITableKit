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
@synthesize title, state, delegate;

+(TKSwitchCell*) cellWithTitle:(NSString*)title state:(BOOL)state
{
    return [[[self alloc] initWithTitle:title state:state] autorelease];
}

-(id) initWithTitle:(NSString*)aTitle state:(BOOL)aState
{
    self = [super init];
    if(self)
	{
        self.title = aTitle;
        self.state = aState; 
    }
    return self;
}

-(void) dealloc
{
    [title release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKSwitchCellView* cellView = (TKSwitchCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithTitle:title state:state];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKSwitchCellView* cellView = [tableView.theme switchCellView];
	cellView.owner = self;
	[cellView.switchButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
	[cellView.switchButton addTarget:self action:@selector(onSwitchBtn:) forControlEvents:UIControlEventValueChanged];
	[cellView updateWithTitle:title state:state];
	[self applyAttributesToCellView:cellView];
    return cellView;
}

-(void) onSwitchBtn:(UISwitch*)sender
{
    state = [sender isOn];
    if([delegate respondsToSelector:@selector(switchCell:didSwitchState:)])
	{
        [delegate switchCell:self didSwitchState:[sender isOn]];
    }
}

-(void) setFont:(UIFont*)font
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textLabel) selector:@selector(setFont:) value:font];
	[self addAttribute:attr];
	[attr release];
}

-(void) setTextColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textLabel) selector:@selector(setTextColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}


@end
