//
//  TKCell.m
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


#import "TKCell.h"
#import "TKCellView.h"
#import "TKTheme.h"
#import "TKCellAttribute.h"
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrTableViewCellProxyInterface)
+(TKAttrTableViewCellProxyInterface*) sharedTableViewCellProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@interface TKAttrProxy(TKAttrImageViewProxyInterface)
+(TKAttrImageViewProxyInterface*) sharedImageViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@interface TKCell()
{
	NSMutableArray* _attributes;
}
@end

@implementation TKCell

-(id) init
{
	self = [super init];
	if(self)
	{
		_cellHeight = 44;
	}
	return self;
}

-(NSMutableArray*) attributes
{
	if(!_attributes) {
		_attributes = [[NSMutableArray alloc] initWithCapacity:1];
	}
	return _attributes;
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    return nil;
}

-(CGFloat) cellHeightForTableView:(UITableView*)tableView
{
	return _cellHeight;
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	
}

-(void) addAttribute:(TKCellAttribute*)attr
{
	if(_attributes==nil)
	{
		_attributes = [[NSMutableArray alloc] initWithCapacity:1];
	}
	else
	{
		[_attributes removeObject:attr];
	}
	[_attributes addObject:attr];
}

-(void) applyAttributesToCellView:(TKCellView*)cellView
{
	if(cellView.rollbackArribute)
	{
		[cellView.rollbackArribute apply:cellView];
		[cellView.rollbackArribute clean];
	}

	if(_attributes)
	{
		if(!cellView.rollbackArribute)
		{
			cellView.rollbackArribute = [[TKRollbackArribute alloc] init];
		}
		
		for(TKCellAttribute* attr in _attributes)
		{
			id v = [attr getRollbackValue:cellView];
			if(v) {
				[cellView.rollbackArribute addAttribute:attr withRollbackValue:v];
				[attr apply:cellView];
			}
		}
	}
}

-(TKAttrTableViewCellProxyInterface*) tableViewCell
{
	return [TKAttrProxy sharedTableViewCellProxyWithAccessor:NULL attributes:self.attributes];
}

-(TKAttrImageViewProxyInterface*) imageView
{
	return [TKAttrProxy sharedImageViewProxyWithAccessor:@selector(imageView) attributes:self.attributes];
}

// TKCellView specific attributes
-(void) setPreventEditing:(BOOL)preventEditing
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithAccessor:NULL getter:@selector(preventEditing) setter:@selector(setPreventEditing:) value:&preventEditing];
	[self addAttribute:attr];
}



@end







