//
//  TKSwitchCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKSwitchCell.h"


@implementation TKSwitchCell
@synthesize title, state, delegate;

+(TKSwitchCell*) cellWithTitle:(NSString*)title state:(BOOL)state
{
    return [[[self alloc] initWithTitle:title state:state] autorelease];
}

-(id) initWithTitle:(NSString*)aTitle state:(BOOL)aState
{
    self = [super init];
    if(self)
	{
        self.title = aTitle;
        self.state = aState; 
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
    static NSString* cellId = @"TKSwitchCellId";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId] autorelease];
        
        UISwitch* switchBtn = [[[UISwitch alloc] initWithFrame:CGRectMake(200, 9, 40, 20)] autorelease];
        switchBtn.tag = 100;
        [cell addSubview:switchBtn];
    }

    cell.textLabel.text = title;
    UISwitch* switchBtn = (UISwitch*)[cell viewWithTag:100];
    [switchBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
	[switchBtn addTarget:self action:@selector(onSwitchBtn:) forControlEvents:UIControlEventValueChanged];
    [switchBtn setOn:state];
    
    return cell;
}

-(void) onSwitchBtn:(UISwitch*)sender
{
    state = [sender isOn];
    if([delegate respondsToSelector:@selector(switchCell:didSwitchState:)])
	{
        [delegate switchCell:self didSwitchState:[sender isOn]];
    }
}


@end
