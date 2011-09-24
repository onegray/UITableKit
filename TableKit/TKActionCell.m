//
//  TKActionCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKActionCell.h"
#import "TKActionCellView.h"
#import "TKTheme.h"

@implementation TKActionCell
@synthesize title;

+(TKActionCell*) cellWithTitle:(NSString*)aTitle target:(id)aTarget action:(SEL)actionSelector
{
    return [[[self alloc] initWithTitle:aTitle target:aTarget action:actionSelector] autorelease];
}

-(id) initWithTitle:(NSString*)aTitle target:(id)aTarget action:(SEL)actionSelector
{
    self = [super init];
    if(self)
	{
        self.title = aTitle;
        target = aTarget;
        action = actionSelector;
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
	TKActionCellView* cell = (TKActionCellView*)[self lookupCellViewInTableView:tableView];
    [cell updateWithTitle:title];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKActionCellId";

    TKActionCellView* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
		TKTheme* theme = [TKTheme themeForTableView:tableView];
        cell = [theme actionCellViewWithReuseId:cellId];
    }

	cell.owner = self;
    [cell updateWithTitle:title];
	[self applyAttributesToCellView:cell];
    
	return cell;
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
    if([target respondsToSelector:action])
	{
		NSMethodSignature* methodSignature = [target methodSignatureForSelector:action];
		if([methodSignature numberOfArguments]==2+1)
		{
            [target performSelector:action withObject:self];
		}
		else if([methodSignature numberOfArguments]==2)
		{
            [target performSelector:action];
		}
    }
}



@end
