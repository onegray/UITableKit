//
//  TKDefaultSwitchCellView.h
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKDefaultSwitchCellView : TKSwitchCellView
{
	UISwitch* switchButton;	
}
@property (nonatomic, readonly) UISwitch* switchButton;

-(void) updateWithTitle:(NSString*)title state:(BOOL)state;

@end
