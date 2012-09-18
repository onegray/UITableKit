//
//  TKCellProtocol.h
//  TableKitSample
//
//  Created by onegray on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TKCellProtocol <NSObject>

@required
-(UITableViewCell*) cellForTableView:(UITableView*)tableView;
-(CGFloat) cellHeightForTableView:(UITableView*)tableView;

@optional
-(void) tableViewDidSelectCell:(UITableView*)tableView;
-(void) tableViewAccessoryButtonTapped:(UITableView*)tableView;

@end
