//
//  ProductCellView.h
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@class ProductModel;

@interface ProductCellView : TKCellView

-(void) setProduct:(ProductModel*)product;

@end

