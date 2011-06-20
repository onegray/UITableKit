//
//  TKTextFieldCellView.m
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextFieldCellView.h"

@implementation TKTextFieldCellView
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
