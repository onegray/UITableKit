//
//  TKSwitchCellView.m
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKSwitchCellView.h"

@implementation TKSwitchCellView
@synthesize switchBtn;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(200, 9, 40, 20)];
        [self addSubview:switchBtn];
		[switchBtn release];
    }
    return self;
}

-(void) updateWithTitle:(NSString*)title state:(BOOL)state
{
	self.textLabel.text = title;
	switchBtn.on = state;
}


@end
