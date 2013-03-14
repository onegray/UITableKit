//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___SwitchCellView.h"

@implementation ___FILEBASENAME___SwitchCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        _switchButton = [[UISwitch alloc] initWithFrame:CGRectZero];
		self.accessoryView = _switchButton;
		self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
	self.switchButton.on = state;
}

@end
