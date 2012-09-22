//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import "___VARIABLE_categoryClass___CellView.h"
#import "___VARIABLE_themeClass___.h"

@implementation ___VARIABLE_categoryClass:identifier___ (CellCategory)

-(void) updateCellView:(___VARIABLE_categoryClass:identifier___CellView*) cellView
{
	//TODO: Update cellView with cell data
	cellView.textLabel.text = [self description];
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	___VARIABLE_categoryClass:identifier___CellView* cellView = (___VARIABLE_categoryClass:identifier___CellView*)[tableView lookupCellViewForCell:self];
	[self updateCellView:cellView];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	___VARIABLE_categoryClass:identifier___CellView* cellView = [(___VARIABLE_themeClass___*)tableView.theme create___VARIABLE_categoryClass:identifier___CellView];
	cellView.owner = self;
	[self updateCellView:cellView];
	return cellView;
}

-(CGFloat) cellHeightForTableView:(UITableView*)tableView
{
	return 44;
}

/*
-(void) tableViewDidSelectCell:(UITableView*) tableView
{
}
*/

/*
-(void) tableViewAccessoryButtonTapped:(UITableView*) tableView
{
}
*/

@end
