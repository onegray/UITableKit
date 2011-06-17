//
//  TKCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TKCell : NSObject
{
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView;
-(CGFloat) cellHeight;

-(void) tableViewDidSelectCell:(UITableView*)tableView;

@end
