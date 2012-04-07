//
//  TKDefaultSwitchCellView.m
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKDefaultSwitchCellView.h"

@implementation TKDefaultSwitchCellView
@synthesize switchButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(200, 9, 40, 20)];
        [self addSubview:switchButton];
		[switchButton release];
    }
    return self;
}

-(void) updateWithTitle:(NSString*)title state:(BOOL)state
{
	self.textLabel.text = title;
	switchButton.on = state;
}


@end
