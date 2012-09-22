//
//  UserDefinedCell.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserDefinedCell.h"
#import "UserDefinedCellView.h"
#import "CustomTheme.h"

@implementation UserDefinedCell
@synthesize title;

-(id) initWithTitle:(NSString*)titleText
{
	self = [super init];
	if(self)
	{
		self.title = titleText;
		cellHeight = 90;
	}
	return self;
}

-(void) dealloc
{
	[title release];
	[super dealloc];
}

-(void) updateCellView:(UserDefinedCellView*) cellView
{
	//TODO: Update cellView with cell data

	cellView.titleLabel.text = title;
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	UserDefinedCellView* cellView = (UserDefinedCellView*)[tableView lookupCellViewForCell:self];
	[self updateCellView:cellView];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	UserDefinedCellView* cellView = [(CustomTheme*)tableView.theme createUserDefinedCellView];
	cellView.owner = self;
	[self applyAttributesToCellView:cellView];
	[self updateCellView:cellView];
	return cellView;
}

@end
