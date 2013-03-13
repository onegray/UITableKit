//
//  CustomSwitchCellView.h
//  TableKitSample
//
//  Created by onegray on 3/14/13.
//
//

#import "CustomGeneralCellView.h"

@interface CustomSwitchCellView : CustomGeneralCellView <TKSwitchCellViewProtocol>

@property (nonatomic, readonly) UISwitch* switchButton;
-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state;

@end
