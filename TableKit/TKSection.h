//
//  TKSection.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TKCell;

@interface TKSection : NSObject {
    
    NSMutableArray* cells;
    
    CGFloat headerHeight;
    NSString* headerTitle;
    UIView* headerView;
    CGFloat footerHeight;
    NSString* footerTitle;
    UIView* footerView;    
}

@property (nonatomic, readonly) int cellCount;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, retain) NSString* headerTitle;
@property (nonatomic, retain) UIView* headerView;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, retain) NSString* footerTitle;
@property (nonatomic, retain) UIView* footerView;

+(TKSection*) sectionWithCells: (TKCell*)cell, ... NS_REQUIRES_NIL_TERMINATION;
-(TKCell*) cellAtIndex:(int)cellIndex;
-(void) addCell:(TKCell*)cellHolder; 
-(void) removeCellAtIndex:(int)cellIndex;
-(void) removeAllCells;
-(void) insertCell:(TKCell*)cell atIndex:(int)cellIndex;
-(UITableViewCell*) cellWithIndex:(int)cellIndex forTableView:(UITableView*)tableView;
-(CGFloat) heightForCellIndex:(int)cellIndex;

-(void) tableView:(UITableView*)tableView didSelectCellWithIndex:(int)cellIndex;


@end
