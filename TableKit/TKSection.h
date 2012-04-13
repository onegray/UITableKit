//
//  TKSection.h
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

@class TKCell;

@interface TKSection : NSObject {
    
    NSMutableArray* cells;
    
    CGFloat headerHeight;
    NSString* headerTitle;
    UIView* headerView;
    CGFloat footerHeight;
    NSString* footerTitle;
    UIView* footerView;    
	
	BOOL preventEditing;
	BOOL allowsReorderingDuringEditing;
	BOOL preventIndentationDuringEditing;
}

@property (nonatomic, readonly) int cellCount;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, retain) NSString* headerTitle;
@property (nonatomic, retain) UIView* headerView;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, retain) NSString* footerTitle;
@property (nonatomic, retain) UIView* footerView;

@property (nonatomic, assign) BOOL preventEditing;
@property (nonatomic, assign) BOOL allowsReorderingDuringEditing;
@property (nonatomic, assign) BOOL preventIndentationDuringEditing;

+(TKSection*) sectionWithCells: (TKCell*)cell, ... NS_REQUIRES_NIL_TERMINATION;
-(TKCell*) cellAtIndex:(int)cellIndex;
-(void) addCell:(TKCell*)cellHolder; 
-(void) removeCellAtIndex:(int)cellIndex;
-(void) removeAllCells;
-(void) insertCell:(TKCell*)cell atIndex:(int)cellIndex;
-(int) indexOfCell:(TKCell*)cell;
-(UITableViewCell*) cellWithIndex:(int)cellIndex forTableView:(UITableView*)tableView;
-(CGFloat) heightForCellIndex:(int)cellIndex;

-(void) tableView:(UITableView*)tableView didSelectCellWithIndex:(int)cellIndex;


@end
