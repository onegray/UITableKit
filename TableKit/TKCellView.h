//
//  TKCellView.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2012 Sergey Nikitenko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>

@class TKRollbackArribute;
@interface TKCellView : UITableViewCell
{
	id owner;
	BOOL preventEditing;
	NSString* tableViewCellReuseId;
	TKRollbackArribute* rollbackArribute;
}
@property (nonatomic, assign) id owner;
@property (nonatomic, assign) BOOL preventEditing;
@property (nonatomic, copy) NSString* reuseIdentifier;
@property (nonatomic, retain) TKRollbackArribute* rollbackArribute;

@end


@protocol TKGeneralCellViewProtocol <NSObject>
@required
-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText;
@end

#define TKGeneralCellView TKCellView<TKGeneralCellViewProtocol>


@protocol TKTextFieldCellViewProtocol <NSObject>
@required
-(UITextField*) textField;
-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder;
@end

#define TKTextFieldCellView TKCellView<TKTextFieldCellViewProtocol>


@protocol TKSwitchCellViewProtocol <NSObject>
@required
-(UIControl*) switchButton;
-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state;
@end

#define TKSwitchCellView TKCellView<TKSwitchCellViewProtocol>


@protocol TKTextViewCellViewProtocol <NSObject>
-(UITextView*) textView;
-(void) updateWithText:(NSString*)text;
@end

#define TKTextViewCellView TKCellView<TKTextViewCellViewProtocol>

