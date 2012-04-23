//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___GeneralCellView.h"

@implementation ___FILEBASENAME___GeneralCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
}

@end
