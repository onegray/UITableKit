//
//  TKTheme.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TKCellView, TKStaticCellView, TKActionCellView, TKTextFieldCellView, TKSwitchCellView, TKTextViewCellView;

@interface TKTheme : NSObject
{
	
}

+(TKTheme*) themeForTableView:(UITableView*)tableView;

-(TKStaticCellView*) staticCellViewWithReuseId:(NSString*)reuseId;
-(TKActionCellView*) actionCellViewWithReuseId:(NSString*)reuseId;
-(TKTextFieldCellView*) textFieldCellViewWithReuseId:(NSString*)reuseId;
-(TKSwitchCellView*) switchCellViewWithReuseId:(NSString*)reuseId;
-(TKTextViewCellView*) textViewCellViewWithReuseId:(NSString*)reuseId;


@end
