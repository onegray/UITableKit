//
//  TKAttrTableViewCellProxyInterface.h
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

@interface TKAttrTableViewCellProxyInterface : TKAttrViewProxyInterface

@property(nonatomic, retain, writeonly) UIView *backgroundView;
@property(nonatomic, retain, writeonly) UIView *selectedBackgroundView;
@property(nonatomic, retain, writeonly) UIView *multipleSelectionBackgroundView __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
@property(nonatomic, assign, writeonly) UITableViewCellSelectionStyle selectionStyle;
@property(nonatomic, assign, writeonly) BOOL selected;
@property(nonatomic, assign, writeonly) BOOL highlighted;
@property(nonatomic, assign, writeonly) BOOL showsReorderControl;
@property(nonatomic, assign, writeonly) BOOL shouldIndentWhileEditing;
@property(nonatomic, assign, writeonly) UITableViewCellAccessoryType accessoryType;
@property(nonatomic, retain, writeonly) UIView *accessoryView;
@property(nonatomic, assign, writeonly) UITableViewCellAccessoryType editingAccessoryType;
@property(nonatomic, retain, writeonly) UIView *editingAccessoryView;
@property(nonatomic, assign, writeonly) NSInteger indentationLevel;
@property(nonatomic, assign, writeonly) CGFloat indentationWidth;
@property(nonatomic, assign, writeonly) BOOL editing;

@end
