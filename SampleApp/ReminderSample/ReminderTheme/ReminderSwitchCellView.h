//
//  ReminderSwitchCellView.h
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderGeneralCellView.h"

@interface ReminderSwitchCellView : ReminderGeneralCellView
{
	UISwitch* switchButton;	
}
@property (nonatomic, readonly) UISwitch* switchButton;

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state;

@end
