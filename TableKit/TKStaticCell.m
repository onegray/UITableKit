//
//  TKStaticCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKStaticCell.h"
#import "TKTheme.h"
#import "TKStaticCellView.h"
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
	TKStaticCellView* cell = (TKStaticCellView*)[self lookupCellViewInTableView:tableView];
	[cell updateWithText:title];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKStaticCellId";
    
    TKStaticCellView* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
		TKTheme* theme = [TKTheme themeForTableView:tableView];
        cell = [theme staticCellViewWithReuseId:cellId];
    }
    
	cell.owner = self;
	[cell updateWithText:title];
	[self applyAttributesToCellView:cell];

    return cell;
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








