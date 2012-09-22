//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import "___VARIABLE_categoryClass___CellView.h"

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
	static NSString* reuseId = @"___VARIABLE_categoryClass:identifier___CellId";
	___VARIABLE_categoryClass:identifier___CellView* cellView = (___VARIABLE_categoryClass:identifier___CellView*)[tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [[[___VARIABLE_categoryClass:identifier___CellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
	}
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
