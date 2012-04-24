//
//  UserDefinedCell.h
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCell.h"

@interface UserDefinedCell : TKCell

-(id) initWithTitle:(NSString*)titleText;

@property (nonatomic, retain) NSString* title;

@end
