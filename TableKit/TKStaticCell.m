//
//  TKStaticCell.m
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

#import "TKStaticCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKAttrProxy.h"


@interface TKAttrProxy(TKAttrLabelProxyInterface)
+(TKAttrLabelProxyInterface*) sharedLabelProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@implementation TKStaticCell
@synthesize text, detailText, cellStyle;

+(id) cellWithText:(NSString*)aText
{
    return [[self alloc] initWithText:aText];
}

+(id) cellWithStyle:(UITableViewCellStyle)cellStyle text:(NSString*)text detailText:(NSString*)detailText
{
	return [[self alloc] initWithStyle:cellStyle text:text detailText:detailText];
}

-(id) initWithText:(NSString*)aText
{
    self = [super init];
    if(self)
	{
        self.text = aText;
		cellStyle = UITableViewCellStyleDefault;
    }
    return self;
}

-(id) initWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText
{
    self = [super init];
    if(self)
	{
        self.text = aText;
		self.detailText = aDetailText;
		cellStyle = aCellStyle;
    }
    return self;
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	TKGeneralCellView* cellView = (TKGeneralCellView*)[tableView lookupCellViewForCell:self];
	[cellView updateWithText:text detailText:detailText];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKGeneralCellView* cellView = [tableView.theme generalCellViewWithStyle:cellStyle];
	cellView.owner = self;
	[cellView updateWithText:text detailText:detailText];
	[self applyAttributesToCellView:cellView];
    return cellView;
}

-(TKAttrLabelProxyInterface*) textLabel
{
	return [TKAttrProxy sharedLabelProxyWithAccessor:@selector(textLabel) attributes:self.attributes];
}

-(TKAttrLabelProxyInterface*) detailTextLabel
{
	return [TKAttrProxy sharedLabelProxyWithAccessor:@selector(detailTextLabel) attributes:self.attributes];
}


@end








