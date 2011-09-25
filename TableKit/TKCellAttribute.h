//
//  TKCellAttribute.h
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

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
	NSObject* objectValue;
}

-(id) initWithSelector:(SEL)sel value:(NSObject*)value;
-(id) initWithAccessor:(SEL)acr selector:(SEL)sel value:(NSObject*)value;

-(void) apply:(id)target;

@end


@interface TKCellScalarAttribute : TKCellAttribute
{
	int scalarValue;
}

-(id) initWithSelector:(SEL)sel value:(int)value;
-(id) initWithAccessor:(SEL)acr selector:(SEL)sel value:(int)value;

-(void) apply:(id)target;

@end

