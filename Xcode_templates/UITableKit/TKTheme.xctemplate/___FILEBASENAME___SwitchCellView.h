//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "TKCellView.h"

@interface ___FILEBASENAME___SwitchCellView : TKSwitchCellView
{
	UISwitch* switchButton;	
}
@property (nonatomic, readonly) UISwitch* switchButton;

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state;

@end
