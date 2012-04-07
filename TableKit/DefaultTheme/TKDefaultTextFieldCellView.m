//
//  TKDefaultTextFieldCellView.m
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKDefaultTextFieldCellView.h"

@implementation TKDefaultTextFieldCellView
@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 12, 270, 40)];
		[self addSubview:textField];
		[textField release];
    }
    return self;
}

-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder
{
    textField.text = text;
    textField.placeholder = placeholder;
}

@end
