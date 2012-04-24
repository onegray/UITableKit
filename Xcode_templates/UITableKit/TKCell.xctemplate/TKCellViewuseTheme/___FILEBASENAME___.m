//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME___View.h"
#import "___VARIABLE_themeClass___.h"

@implementation ___FILEBASENAME___

-(void) updateCellView:(___FILEBASENAME___View*) cellView
{
	//TODO: Update cellView with cell data
	cellView.textLabel.text = [self description];
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	___FILEBASENAME___View* cellView = (___FILEBASENAME___View*)[self lookupCellViewInTableView:tableView];
	[self updateCellView:cellView];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	___FILEBASENAME___View* cellView = [(___VARIABLE_themeClass___*)tableView.theme create___FILEBASENAME___View];
	cellView.owner = self;
	[self applyAttributesToCellView:cellView];
	[self updateCellView:cellView];
	return cellView;
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{

}

-(void) tableViewAccessoryButtonTapped:(UITableView*) tableView
{

}


@end
