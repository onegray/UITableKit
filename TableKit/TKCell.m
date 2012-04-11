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

@implementation TKCell

-(void) dealloc 
{
	[attributes release];
	[super dealloc];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    return nil;
}

-(CGFloat) cellHeight
{
    return 44;
}

-(TKCellView*) lookupCellViewInTableView:(UITableView*)tableView
{
	NSArray* visibleCells = [tableView visibleCells];
	for(id tvCell in visibleCells)
	{
		if([tvCell isKindOfClass:[TKCellView class]])
		{
			if([(TKCellView*)tvCell owner] == self) 
			{
				return (TKCellView*)tvCell;
			}
		}
	}
	return nil;
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
	
}


-(void) addAttribute:(TKCellAttribute*)attr
{
	if(attributes==nil)
	{
		attributes = [[NSMutableArray alloc] initWithCapacity:1];
	}
	else
	{
		[attributes removeObject:attr];
	}
	[attributes addObject:attr];
}

-(void) applyAttributesToCellView:(TKCellView*)cellView
{
	for(TKCellAttribute* attr in attributes)
	{
		[attr apply:cellView];
	}
}


// Managing Images as Cell Content

-(void) setImage:(UIImage*)image
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(imageView) selector:@selector(setImage:) value:image];
	[self addAttribute:attr];
	[attr release];
}

// Accessing Views of the Cell Object

-(void) setBackgroundView:(UIView*)view
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithSelector:@selector(setBackgroundView:) value:view];
	[self addAttribute:attr];
	[attr release];
}

-(void) setSelectedBackgroundView:(UIView*)view
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithSelector:@selector(setSelectedBackgroundView:) value:view];
	[self addAttribute:attr];
	[attr release];
}

-(void) setMultipleSelectionBackgroundView:(UIView*)view
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithSelector:@selector(setMultipleSelectionBackgroundView:) value:view];
	[self addAttribute:attr];
	[attr release];
}

// Managing Accessory Views

-(void) setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setAccessoryType:) value:accessoryType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setAccessoryView:(UIView*)view
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithSelector:@selector(setAccessoryView:) value:view];
	[self addAttribute:attr];
	[attr release];
}

-(void) setEditingAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setEditingAccessoryType:) value:accessoryType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setEditingAccessoryView:(UIView*)view
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithSelector:@selector(setEditingAccessoryView:) value:view];
	[self addAttribute:attr];
	[attr release];
}

// Managing Cell Selection and Highlighting

-(void) setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setSelectionStyle:) value:selectionStyle];
	[self addAttribute:attr];
	[attr release];
}

// Managing Content Indentation

-(void) setIndentationLevel:(NSInteger)indentationLevel
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setIndentationLevel:) value:indentationLevel];
	[self addAttribute:attr];
	[attr release];
}

-(void) setIndentationWidth:(CGFloat)indentationWidth
{
	TKCellAttribute* attr = [[TKCellFloatAttribute alloc] initWithSelector:@selector(setIndentationWidth:) value:indentationWidth];
	[self addAttribute:attr];
	[attr release];
}


// TKCellView specific attributes

-(void) setPreventEditing:(BOOL)preventEditing
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithSelector:@selector(setPreventEditing:) value:preventEditing];
	[self addAttribute:attr];
	[attr release];
}


@end







