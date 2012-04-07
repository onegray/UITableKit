//
//  TKTextViewCell.h
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKCell.h"

@interface TKTextViewCell : TKCell
{
    NSString* text;
    NSString* placeholder;
    CGFloat cellHeight;
}
@property (nonatomic, retain) NSString* text;
@property (nonatomic, assign) CGFloat cellHeight;

+(TKTextViewCell*) cellWithText:(NSString*)text;
-(id) initWithText:(NSString*)text;

-(void) setKeyboardType:(UIKeyboardType)keyboardType;
-(void) setFont:(UIFont*)font;
-(void) setTextColor:(UIColor*)color;
-(void) setBackgroundColor:(UIColor*)color;

@end
