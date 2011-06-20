//
//  TKSwitchCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKSwitchCell.h"
#import "TKTheme.h"
#import "TKSwitchCellView.h"


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
	TKSwitchCellView* cell = (TKSwitchCellView*)[self lookupCellViewInTableView:tableView];
	[cell updateWithTitle:title state:state];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKSwitchCellId";
    
    TKSwitchCellView* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
		TKTheme* theme = [TKTheme themeForTableView:tableView];
        cell = [theme switchCellViewWithReuseId:cellId];
    }
	
	cell.owner = self;
	[cell.switchBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
	[cell.switchBtn addTarget:self action:@selector(onSwitchBtn:) forControlEvents:UIControlEventValueChanged];

	[cell updateWithTitle:title state:state];
    
    return cell;
}

-(void) onSwitchBtn:(UISwitch*)sender
{
    state = [sender isOn];
    if([delegate respondsToSelector:@selector(switchCell:didSwitchState:)])
	{
        [delegate switchCell:self didSwitchState:[sender isOn]];
    }
}


@end
