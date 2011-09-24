//
//  TKTextFieldCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKCell.h"

@class TKTextFieldCell;
@protocol TKTextFieldCellDelegate <NSObject>
@optional
-(void)textFieldCellDidEndEditing:(TKTextFieldCell*)cell;
@end

@interface TKTextFieldCell : TKCell
{
    NSString* text;
    NSString* placeholder;
	id<TKTextFieldCellDelegate> delegate;
}

@property (nonatomic, assign) id<TKTextFieldCellDelegate> delegate;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* placeholder;

+(TKTextFieldCell*) cellWithText:(NSString*)text placeholder:(NSString*)placeholder;
-(id) initWithText:(NSString*)text placeholder:(NSString*)placeholder;

-(void) setKeyboardType:(UIKeyboardType)keyboardType;
-(void) setFont:(UIFont*)font;

@end
