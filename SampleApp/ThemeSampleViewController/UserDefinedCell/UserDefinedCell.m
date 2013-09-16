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
		self.cellHeight = 90;
	}
	return self;
}

-(void) updateCellView:(UserDefinedCellView*) cellView
{
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
	cellView.cellRef = (id)self;
	[self applyAttributesToCellView:cellView];
	[self updateCellView:cellView];
	return cellView;
}

@end
