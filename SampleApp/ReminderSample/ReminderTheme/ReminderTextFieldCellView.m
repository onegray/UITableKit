//
//  ReminderTextFieldCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderTextFieldCellView.h"

@implementation ReminderTextFieldCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{

    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];

}

-(void) updateWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder
{
	[super updateWithTitle:title text:text placeholder:placeholder];
	
}

@end
