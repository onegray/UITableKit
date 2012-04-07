//
//  TKTheme.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKCellView.h"

@protocol TKThemeProtocol <NSObject>

-(TKStaticCellView*) staticCellViewWithReuseId:(NSString*)reuseId;
-(TKActionCellView*) actionCellViewWithReuseId:(NSString*)reuseId;
-(TKTextFieldCellView*) textFieldCellViewWithReuseId:(NSString*)reuseId;
-(TKSwitchCellView*) switchCellViewWithReuseId:(NSString*)reuseId;
-(TKTextViewCellView*) textViewCellViewWithReuseId:(NSString*)reuseId;

@end


@interface UITableView (theme)
-(void) applyTheme:(id<TKThemeProtocol>)theme;
@property (nonatomic, readonly) id<TKThemeProtocol> theme;
@end
