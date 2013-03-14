//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	static NSString* reuseId = @"___FILEBASENAME___Id";
	UITableViewCell* cellView = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
		
		//TODO: customize cellView immutable properties
		cellView.selectionStyle = UITableViewCellSelectionStyleNone;
		cellView.accessoryType = UITableViewCellAccessoryNone;
	}
	
	//TODO: Update cellView with cell data
	cellView.textLabel.text = [self description];
	
	return cellView;
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
	
}

-(void) tableViewAccessoryButtonTapped:(UITableView*) tableView
{
	
}

@end
