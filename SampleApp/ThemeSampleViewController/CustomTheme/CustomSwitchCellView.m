//
//  CustomSwitchCellView.m
//  TableKitSample
//
//  Created by onegray on 3/14/13.
//
//

#import "CustomSwitchCellView.h"

@implementation CustomSwitchCellView
@synthesize switchButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
	{
        switchButton = [[[UISwitch alloc] initWithFrame:CGRectZero] autorelease];
		self.accessoryView = switchButton;
		self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
	switchButton.on = state;
}

@end
