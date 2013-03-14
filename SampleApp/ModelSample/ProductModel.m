//
//  ProductModel.m
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

-(id) initWithDictionary:(NSDictionary*)dictionary
{
	self = [super init];
	if(self) {
		self.title = [dictionary objectForKey:@"title"];
		self.description = [dictionary objectForKey:@"description"];
		self.rating = [[dictionary objectForKey:@"rating"] intValue];
	}
	return self;
}

-(NSDictionary*) serializeToDictionary
{
	NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
	[dictionary setObject:_title forKey:@"title"];
	[dictionary setObject:_description forKey:@"description"];
	[dictionary setObject:[NSNumber numberWithInt:_rating] forKey:@"rating"];
	return dictionary;
}

@end
