//
//  TKCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCell.h"
#import "TKCellView.h"
#import "TKTheme.h"
#import "TKCellAttribute.h"

@implementation TKCell

-(void) dealloc 
{
	[attributes release];
	[super dealloc];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    return nil;
}

-(CGFloat) cellHeight
{
    return 44;
}

-(TKCellView*) lookupCellViewInTableView:(UITableView*)tableView
{
	NSArray* visibleCells = [tableView visibleCells];
	for(id tvCell in visibleCells)
	{
		if([tvCell isKindOfClass:[TKCellView class]])
		{
			if([(TKCellView*)tvCell owner] == self) 
			{
				return (TKCellView*)tvCell;
			}
		}
	}
	return nil;
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
	
}


-(void) addAttribute:(TKCellAttribute*)attr
{
	if(attributes==nil)
	{
		attributes = [[NSMutableArray alloc] initWithCapacity:1];
	}
	else
	{
		[attributes removeObject:attr];
	}
	[attributes addObject:attr];
}

-(void) applyAttributesToCellView:(TKCellView*)cellView
{
	for(TKCellAttribute* attr in attributes)
	{
		[attr apply:cellView];
	}
}

-(void) setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setAccessoryType:) scalarValue:accessoryType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setSelectionStyle:) scalarValue:selectionStyle];
	[self addAttribute:attr];
	[attr release];
}


@end







