//
//  TKTheme.h
//
//  Created by Sergey Nikitenko on 6/20/11.
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
#import "TKCellView.h"

@protocol TKThemeProtocol <NSObject>
@optional // if method is not implemented it will be forwarded to builtin TKDefaultTheme

-(TKGeneralCellView*) generalCellViewWithStyle:(UITableViewCellStyle)cellStyle;
-(TKGeneralCellView*) actionCellViewWithStyle:(UITableViewCellStyle)cellStyle;
-(TKSwitchCellView*) switchCellViewWithStyle:(UITableViewCellStyle)cellStyle;
-(TKTextFieldCellView*) textFieldCellViewWithStyle:(UITableViewCellStyle)cellStyle;
-(TKTextViewCellView*) textViewCellView;

-(void) configureTableView:(UITableView*)tableView;

@end


@interface TKThemeCacheProxy : NSProxy <TKThemeProtocol>
-(Class) cellClassForSelector:(SEL)selector style:(int)style;
-(TKCellView*) cachedCellForSelector:(SEL)selector style:(int)style;
@end


@interface UITableView (theme)
+(void) setDefaultTheme:(id<TKThemeProtocol>)theme;
-(void) applyTheme:(id<TKThemeProtocol>)theme;
@property (nonatomic, readonly) TKThemeCacheProxy* theme;
@end
