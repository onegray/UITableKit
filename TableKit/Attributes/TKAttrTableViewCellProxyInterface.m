//
//  TKAttrTableViewCellProxyInterface.m
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

#import "TKAttrTableViewCellProxyInterface.h"
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrTableViewCellProxyInterface)
+(TKAttrTableViewCellProxyInterface*) sharedTableViewCellProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@implementation TKAttrProxy(TKAttrTableViewCellProxyInterface)

+(TKAttrTableViewCellProxyInterface*) sharedTableViewCellProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes
{
	static TKAttrProxy* sharedProxy = nil;
	if(!sharedProxy)
	{
		sharedProxy = [[TKAttrProxy alloc] initWithTargetClass:[UITableViewCell class]];
	}
	return (TKAttrTableViewCellProxyInterface*)[sharedProxy prepareWithAccessor:accessor attributes:attributes];
}

@end


@implementation TKAttrTableViewCellProxyInterface

@dynamic backgroundView;
@dynamic selectedBackgroundView;
@dynamic multipleSelectionBackgroundView;
@dynamic selectionStyle;
@dynamic selected;
@dynamic highlighted;
@dynamic showsReorderControl;
@dynamic shouldIndentWhileEditing;
@dynamic accessoryType;
@dynamic accessoryView;
@dynamic editingAccessoryType;
@dynamic editingAccessoryView;
@dynamic indentationLevel;
@dynamic indentationWidth;
@dynamic editing;

@end




@implementation UITableViewCell(standard_getters)

-(BOOL) selected 
{
	return [self isSelected];
}

-(BOOL) highlighted 
{
	return [self isHighlighted];
}

-(BOOL) editing
{
	return [self isEditing];
}

@end
