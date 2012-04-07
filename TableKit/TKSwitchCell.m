//
//  TKSwitchCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
    TKSwitchCellView* cellView = [tableView.theme switchCellViewWithReuseId:@"TKSwitchCellId"];
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
