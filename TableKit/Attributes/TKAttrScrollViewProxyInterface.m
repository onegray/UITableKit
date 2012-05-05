//
//  TKAttrScrollViewProxyInterface.m
//  TableKitSample
//
//  Created by onegray on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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

#import "TKAttrScrollViewProxyInterface.h"
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrScrollViewProxyInterface)
+(TKAttrScrollViewProxyInterface*) sharedScrollViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@implementation TKAttrProxy(TKAttrScrollViewProxyInterface)

+(TKAttrScrollViewProxyInterface*) sharedScrollViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes
{
	static TKAttrProxy* sharedProxy = nil;
	if(!sharedProxy)
	{
		sharedProxy = [[TKAttrProxy alloc] initWithTargetClass:[UIScrollView class]];
	}
	return (TKAttrScrollViewProxyInterface*)[sharedProxy prepareWithAccessor:accessor attributes:attributes];
}

@end

@implementation TKAttrScrollViewProxyInterface

@dynamic delegate;
@dynamic bounces;
@dynamic alwaysBounceVertical;
@dynamic alwaysBounceHorizontal;
@dynamic pagingEnabled;
@dynamic scrollEnabled;
@dynamic showsHorizontalScrollIndicator;
@dynamic showsVerticalScrollIndicator;
@dynamic decelerationRate;
@dynamic delaysContentTouches;
@dynamic canCancelContentTouches;
@dynamic minimumZoomScale;
@dynamic maximumZoomScale;
@dynamic zoomScale;
@dynamic bouncesZoom;
@dynamic scrollsToTop;

@end


@implementation UIScrollView (standard_getters)

-(BOOL) pagingEnabled
{
	return [self isPagingEnabled];
}

-(BOOL) scrollEnabled
{
	return [self isScrollEnabled];
}

@end