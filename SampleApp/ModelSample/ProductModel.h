//
//  ProductModel.h
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* description;
@property (nonatomic, assign) int rating;

-(id) initWithDictionary:(NSDictionary*)dictionary;
-(NSDictionary*) serializeToDictionary;

@end
