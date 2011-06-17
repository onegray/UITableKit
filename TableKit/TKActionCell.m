//
//  TKActionCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKActionCell.h"

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

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKActionCellId";

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }

    cell.textLabel.text = title;
    
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
