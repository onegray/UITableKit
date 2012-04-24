//
//  CustomGeneralCellView.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomGeneralCellView.h"

@implementation CustomGeneralCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]];
		self.detailTextLabel.backgroundColor = [UIColor clearColor];
		self.detailTextLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:17];
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.textLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:20];
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
}

@end
