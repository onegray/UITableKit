//
//  TKCellAttribute.h
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TKCellView;

@interface TKCellAttribute : NSObject
{
	SEL selector;
	SEL accessor;
}
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) SEL accessor;
-(void) apply:(id)target;

@end


@interface TKCellObjectAttribute : TKCellAttribute
{
	NSObject* object;
}

-(id) initWithSelector:(SEL)sel object:(NSObject*)obj;
-(void) apply:(id)target;

@end


@interface TKCellScalarAttribute : TKCellAttribute
{
	int scalarValue;
}

-(id) initWithSelector:(SEL)sel scalarValue:(int)value;
-(void) apply:(id)target;

@end

