//
//  TKStaticCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKStaticCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"

@implementation TKStaticCell
@synthesize title;

+(TKStaticCell*) cellWithTitle:(NSString*)aTitle
{
    return [[[self alloc] initWithTitle:aTitle] autorelease];
}

-(id) initWithTitle:(NSString*)aTitle
{
    self = [super init];
    if(self)
	{
        self.title = aTitle;
    }
    return self;
}

-(void) dealloc
{
    [title release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKStaticCellView* cellView = (TKStaticCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithText:title];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKStaticCellView* cellView = [tableView.theme staticCellViewWithReuseId:@"TKStaticCellId"];
	cellView.owner = self;
	[cellView updateWithText:title];
	[self applyAttributesToCellView:cellView];
    return cellView;
}


-(void) setFont:(UIFont*)font
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textLabel) selector:@selector(setFont:) value:font];
	[self addAttribute:attr];
	[attr release];
}

-(void) setTextColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textLabel) selector:@selector(setTextColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}



@end








