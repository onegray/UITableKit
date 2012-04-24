//
//  CustomTextFieldCellView.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomTextFieldCellView.h"

@implementation CustomTextFieldCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]];
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.textField.backgroundColor = [UIColor clearColor];
		self.textLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:17];
		self.textField.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:20];
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
