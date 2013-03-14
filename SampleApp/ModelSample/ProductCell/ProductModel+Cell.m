//
//  ProductCell.m
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductModel+Cell.h"
#import "ProductCellView.h"

@implementation ProductModel (Cell)

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	static NSString* reuseId = @"ProductCellId";
	ProductCellView* cellView = (ProductCellView*)[tableView dequeueReusableCellWithIdentifier:reuseId];
	if(!cellView)
	{
		cellView = [[ProductCellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
	}
	[cellView setProduct:self];
    return cellView;
}

-(CGFloat) cellHeightForTableView:(UITableView*)tableView
{
	return 50;
}



@end
