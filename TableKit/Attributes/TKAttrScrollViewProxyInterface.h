//
//  TKAttrScrollViewProxyInterface.h
//  TableKitSample
//
//  Created by Sergey Nikitenko on 5/5/12.
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

@interface TKAttrScrollViewProxyInterface : TKAttrViewProxyInterface

@property(nonatomic, assign, writeonly) id<UIScrollViewDelegate> delegate;
@property(nonatomic, assign, writeonly) BOOL bounces;
@property(nonatomic, assign, writeonly) BOOL alwaysBounceVertical;
@property(nonatomic, assign, writeonly) BOOL alwaysBounceHorizontal;
@property(nonatomic, assign, writeonly) BOOL pagingEnabled;
@property(nonatomic, assign, writeonly) BOOL scrollEnabled;
@property(nonatomic, assign, writeonly) BOOL showsHorizontalScrollIndicator;
@property(nonatomic, assign, writeonly) BOOL showsVerticalScrollIndicator;
@property(nonatomic, assign, writeonly) float decelerationRate __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
@property(nonatomic, assign, writeonly) BOOL delaysContentTouches;
@property(nonatomic, assign, writeonly) BOOL canCancelContentTouches;
@property(nonatomic, assign, writeonly) float minimumZoomScale;
@property(nonatomic, assign, writeonly) float maximumZoomScale;
@property(nonatomic, assign, writeonly) float zoomScale __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
@property(nonatomic, assign, writeonly) BOOL bouncesZoom;
@property(nonatomic, assign, writeonly) BOOL scrollsToTop;

@end
