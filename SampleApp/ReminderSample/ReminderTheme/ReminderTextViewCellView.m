//
//  ReminderTextViewCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderTextViewCellView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ReminderTextViewCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		UIView* cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
		cellBackView.backgroundColor = [UIColor clearColor];
		cellBackView.layer.borderWidth=1;
		cellBackView.layer.borderColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor;
		self.backgroundView = cellBackView;
		
		textView.font = [UIFont systemFontOfSize:17];
		textView.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];

}

-(void) updateWithText:(NSString*)text placeholder:(NSString*)aPlaceholder;
{
	[super updateWithText:text placeholder:aPlaceholder];
	
}

@end
