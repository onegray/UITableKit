//
//  TKAttrViewProxyInterface.h
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


#import <UIKit/UIKit.h>

// Unfortunately, writeonly param is not implemented
#ifndef writeonly
#define writeonly
#endif

@interface TKAttrViewProxyInterface

@property(nonatomic, assign, writeonly) NSInteger tag;
@property(nonatomic, assign, writeonly)	BOOL clipsToBounds;
@property(nonatomic, assign, writeonly) UIColor* backgroundColor;
@property(nonatomic, assign, writeonly) CGFloat alpha;
@property(nonatomic, assign, writeonly) BOOL opaque;
@property(nonatomic, assign, writeonly) BOOL clearsContextBeforeDrawing;
@property(nonatomic, assign, writeonly) BOOL hidden;
@property(nonatomic, assign, writeonly) UIViewContentMode contentMode;
@property(nonatomic, assign, writeonly) BOOL userInteractionEnabled;
@property(nonatomic, assign, writeonly) CGFloat contentScaleFactor __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
@property(nonatomic, assign, writeonly) BOOL multipleTouchEnabled;
@property(nonatomic, assign, writeonly) BOOL exclusiveTouch;
@property(nonatomic, assign, writeonly) BOOL autoresizesSubviews;
@property(nonatomic, assign, writeonly) UIViewAutoresizing autoresizingMask;

@end
