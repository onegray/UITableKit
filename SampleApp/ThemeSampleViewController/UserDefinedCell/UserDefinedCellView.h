//
//  UserDefinedCellView.h
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"
#import "CustomTheme.h"
#import "TKDefaultTheme.h"

@interface UserDefinedCellView : TKCellView
-(UILabel*) titleLabel;
@end

@interface CustomTheme(UserDefinedCellView)
-(UserDefinedCellView*) createUserDefinedCellView;
@end

@interface TKDefaultTheme(UserDefinedCellView)
-(UserDefinedCellView*) createUserDefinedCellView;
@end


