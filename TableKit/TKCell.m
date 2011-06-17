//
//  TKCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCell.h"


@implementation TKCell

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKCellId";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat) cellHeight
{
    return 44;
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{

}



@end
