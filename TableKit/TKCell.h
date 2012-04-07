//
//  TKCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKCellView;
@class TKCellAttribute;

@interface TKCell : NSObject
{
	NSMutableArray* attributes;
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView;
-(CGFloat) cellHeight;

-(TKCellView*) lookupCellViewInTableView:(UITableView*)tableView;
-(void) updateViewInTableView:(UITableView*)tableView;

-(void) tableViewDidSelectCell:(UITableView*)tableView;

-(void) setAccessoryType:(UITableViewCellAccessoryType)accessoryType;
-(void) setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle;

-(void) addAttribute:(TKCellAttribute*)attribute;
-(void) applyAttributesToCellView:(TKCellView*)cellView;

@end
