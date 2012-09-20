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
#import "TKCellProtocol.h"


// WARNING!!!
// TKSection disallows editing cells by user. If you need this functionality then use TKMutableSection instead.

@interface TKSection : NSObject {

    NSArray* cells; // Actually it is NSArray or NSMutableArray
    
    CGFloat headerHeight;
    NSString* headerTitle;
    UIView* headerView;
    CGFloat footerHeight;
    NSString* footerTitle;
    UIView* footerView;
}

@property (nonatomic, readonly) NSArray* cells;
@property (nonatomic, readonly) int cellCount;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, retain) NSString* headerTitle;
@property (nonatomic, retain) UIView* headerView;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, retain) NSString* footerTitle;
@property (nonatomic, retain) UIView* footerView;

-(id) initWithCells:(NSArray*)cellArray;
-(id) initWithMutableArrayOfCells:(NSMutableArray*)cellMutableArray; // Note, cellMutableArray can be changed

+(TKSection*) sectionWithCells:(id<TKCellProtocol>)cell, ... NS_REQUIRES_NIL_TERMINATION;

-(id<TKCellProtocol>) cellAtIndex:(int)cellIndex;
-(void) addCell:(id<TKCellProtocol>)cell; 
-(void) addCellsFromArray:(NSArray *)cellArray;
-(void) removeCellAtIndex:(int)cellIndex;
-(void) removeAllCells;
-(void) insertCell:(id<TKCellProtocol>)cell atIndex:(int)cellIndex;
-(int) indexOfCell:(id<TKCellProtocol>)cell;


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void) tableView:(UITableView*)tableView didSelectCellWithIndex:(int)cellIndex;
-(void) tableView:(UITableView*)tableView accessoryButtonTappedForCellWithIndex:(int)cellIndex;

@end


// TKMutableSection allows editing cells by user.

@interface TKMutableSection : TKSection
{
	BOOL disableEditing;
	BOOL allowsReorderingDuringEditing;
	BOOL preventIndentationDuringEditing;
}

+(TKMutableSection*) sectionWithCells:(id<TKCellProtocol>)cell, ... NS_REQUIRES_NIL_TERMINATION;

@property (nonatomic, assign) BOOL disableEditing;
@property (nonatomic, assign) BOOL allowsReorderingDuringEditing;
@property (nonatomic, assign) BOOL preventIndentationDuringEditing;

@end


@interface TKSection (MutableSection)
-(BOOL) disableEditing;
-(BOOL) allowsReorderingDuringEditing;
-(BOOL) preventIndentationDuringEditing;
@end





