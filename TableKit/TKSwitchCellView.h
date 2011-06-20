//
//  TKSwitchCellView.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKSwitchCellView : TKCellView
{
	UISwitch* switchBtn;	
}
@property (nonatomic, readonly) UISwitch* switchBtn;

-(void) updateWithTitle:(NSString*)title state:(BOOL)state;

@end
