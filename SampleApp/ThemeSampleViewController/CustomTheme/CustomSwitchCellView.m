//
//  CustomSwitchCellView.m
//  TableKitSample
//
//  Created by onegray on 3/14/13.
//
//

#import "CustomSwitchCellView.h"

@implementation CustomSwitchCellView

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


@end
