//
//  TKCellView.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKCellView : UITableViewCell
{
	id owner;
}
@property (nonatomic, assign) id owner;

@end


@protocol TKStaticCellViewProtocol <NSObject>
@required
-(void) updateWithText:(NSString*)text;
@end

#define TKStaticCellView TKCellView<TKStaticCellViewProtocol>


@protocol TKActionCellViewProtocol <NSObject>
@required
-(void) updateWithTitle:(NSString*)text;
@end

#define TKActionCellView TKCellView<TKActionCellViewProtocol>


@protocol TKTextFieldCellViewProtocol <NSObject>
@required
-(UITextField*) textField;
-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder;
@end

#define TKTextFieldCellView TKCellView<TKTextFieldCellViewProtocol>


@protocol TKSwitchCellViewProtocol <NSObject>
@required
-(UISwitch*) switchButton;
-(void) updateWithTitle:(NSString*)title state:(BOOL)state;
@end

#define TKSwitchCellView TKCellView<TKSwitchCellViewProtocol>


@protocol TKTextViewCellViewProtocol <NSObject>
-(UITextView*) textView;
-(void) updateWithText:(NSString*)text;
@end

#define TKTextViewCellView TKCellView<TKTextViewCellViewProtocol>

