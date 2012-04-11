//
//  TKCell.h
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

#import <UIKit/UIKit.h>

@class TKCellView;
@class TKCellAttribute;

@interface TKCell : NSObject
{
	NSMutableArray* attributes;
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView;
-(CGFloat) cellHeight;

-(TKCellView*) lookupCellViewInTableView:(UITableView*)tableView;
-(void) updateViewInTableView:(UITableView*)tableView;

-(void) tableViewDidSelectCell:(UITableView*)tableView;

-(void) addAttribute:(TKCellAttribute*)attribute;
-(void) applyAttributesToCellView:(TKCellView*)cellView;


// Managing Images as Cell Content
-(void) setImage:(UIImage*)image;

// Accessing Views of the Cell Object
-(void) setBackgroundView:(UIView*)view;
-(void) setSelectedBackgroundView:(UIView*)view;
-(void) setMultipleSelectionBackgroundView:(UIView*)view;

// Managing Accessory Views
-(void) setAccessoryType:(UITableViewCellAccessoryType)accessoryType;
-(void) setAccessoryView:(UIView*)view;
-(void) setEditingAccessoryType:(UITableViewCellAccessoryType)accessoryType;
-(void) setEditingAccessoryView:(UIView*)view;

// Managing Cell Selection and Highlighting
-(void) setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle;

// Managing Content Indentation
-(void) setIndentationLevel:(NSInteger)indentationLevel;
-(void) setIndentationWidth:(CGFloat)indentationWidth;

// TKCellView specific attributes
-(void) setPreventEditing:(BOOL)preventEditing;
@end

