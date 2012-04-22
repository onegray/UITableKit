//
//  TKAttrLabelProxyInterface.h
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/22/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
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

#import "TKAttrViewProxyInterface.h"

@interface TKAttrLabelProxyInterface : TKAttrViewProxyInterface

@property(nonatomic, retain, writeonly) UIFont *font;
@property(nonatomic, retain, writeonly) UIColor *textColor;
@property(nonatomic, retain, writeonly) UIColor *shadowColor;
@property(nonatomic, assign, writeonly) UITextAlignment textAlignment;
@property(nonatomic, assign, writeonly) UILineBreakMode lineBreakMode;
@property(nonatomic, retain, writeonly) UIColor *highlightedTextColor;
@property(nonatomic, assign, writeonly) BOOL highlighted;
@property(nonatomic, assign, writeonly) BOOL enabled;
@property(nonatomic, assign, writeonly) NSInteger numberOfLines;
@property(nonatomic, assign, writeonly) BOOL adjustsFontSizeToFitWidth;
@property(nonatomic, assign, writeonly) CGFloat minimumFontSize;
@property(nonatomic, assign, writeonly) UIBaselineAdjustment baselineAdjustment;

@end
