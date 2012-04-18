//
//  TKTextFieldCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 Sergey Nikitenko. All rights reserved.
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
#import "TKCell.h"

@class TKTextFieldCell;
@protocol TKTextFieldCellDelegate <NSObject>
@optional
-(void)textFieldCellDidEndEditing:(TKTextFieldCell*)cell;
@end


@interface TKTextFieldCell : TKCell
{
    NSString* title;
    NSString* text;
    NSString* placeholder;
	UITableViewCellStyle cellStyle;
	id<TKTextFieldCellDelegate> delegate;
}

@property (nonatomic, assign) id<TKTextFieldCellDelegate> delegate;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* placeholder;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

-(id) initWithText:(NSString*)text placeholder:(NSString*)placeholder;
-(id) initWithStyle:(UITableViewCellStyle)style title:(NSString*)title placeholder:(NSString*)placeholder;
-(id) initWithStyle:(UITableViewCellStyle)style title:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;

+(id) cellWithText:(NSString*)text placeholder:(NSString*)placeholder;
+(id) cellWithStyle:(UITableViewCellStyle)style title:(NSString*)title placeholder:(NSString*)placeholder;
+(id) cellWithStyle:(UITableViewCellStyle)style title:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;

-(void) setKeyboardType:(UIKeyboardType)keyboardType;
-(void) setFont:(UIFont*)font;
-(void) setTextColor:(UIColor*)color;

@end
