//
//  ReminderTextViewCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderTextViewCellView.h"

@implementation ReminderTextViewCellView

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

-(void) updateWithText:(NSString*)text placeholder:(NSString*)aPlaceholder;
{
	[super updateWithText:text placeholder:placeholder];
	
}

@end
