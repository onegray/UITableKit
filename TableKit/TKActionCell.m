//
//  TKActionCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKActionCell.h"
#import "TKCellView.h"
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
	TKActionCellView* cellView = (TKActionCellView*)[self lookupCellViewInTableView:tableView];
    [cellView updateWithTitle:title];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKActionCellView* cellView = [tableView.theme actionCellViewWithReuseId:@"TKActionCellId"];
	cellView.owner = self;
    [cellView updateWithTitle:title];
	[self applyAttributesToCellView:cellView];
	return cellView;
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
