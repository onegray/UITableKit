//
//  TKCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCell.h"
#import "TKCellView.h"
#import "TKTheme.h"

@implementation TKCell

-(void) dealloc 
{
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

@end
