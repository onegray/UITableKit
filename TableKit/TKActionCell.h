//
//  TKActionCell.h
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
#import "TKStaticCell.h"

@interface TKActionCell : TKStaticCell

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, copy) void(^handler)(id cell);

+(id) cellWithText:(NSString*)aText handler:(void(^)(id cell))handler;
+(id) cellWithText:(NSString*)text target:(id)target action:(SEL)selector;
+(id) cellWithStyle:(UITableViewCellStyle)cellStyle text:(NSString*)text detailText:(NSString*)detailText handler:(void(^)(id cell))handler;
+(id) cellWithStyle:(UITableViewCellStyle)style text:(NSString*)text detailText:(NSString*)detailText target:(id)target action:(SEL)action;

-(id) initWithText:(NSString*)text handler:(void(^)(id cell))handler;
-(id) initWithText:(NSString*)text target:(id)target action:(SEL)selector;
-(id) initWithStyle:(UITableViewCellStyle)style text:(NSString*)text detailText:(NSString*)detailText target:(id)target action:(SEL)action;
-(id) initWithStyle:(UITableViewCellStyle)style text:(NSString*)text detailText:(NSString*)detailText handler:(void(^)(id cell))handler;

-(void) setTarget:(id)target action:(SEL)selector;

-(void) performCellAction;

@end
