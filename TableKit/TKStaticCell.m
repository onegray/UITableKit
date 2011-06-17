//
//  TKStaticCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKStaticCell.h"

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

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKStaticCellId";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    cell.textLabel.text = title;

    return cell;
}

@end
