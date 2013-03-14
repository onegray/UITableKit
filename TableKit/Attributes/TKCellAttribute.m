//
//  TKCellAttribute.m
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 Sergey Nikitenko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TKCellAttribute.h"

@implementation TKCellAttribute
@synthesize  getter, setter, accessor;

-(BOOL) isEqual:(TKCellAttribute*)object
{
	return setter == object.setter && accessor==object.accessor;
}

-(void) invokeOnTarget:(id)target withArgument:(void*)argument
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellAttribute accessor");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		target = [target performSelector:accessor];
#pragma clang diagnostic pop
		if(!target) {
			return; // accessor returns nil if property isn't initialized, for ex. cell.imageView might be nil
		}
	}
	
	NSAssert([target respondsToSelector:setter], @"Unresponded TKCellAttribute selector");
	NSMethodSignature* sig = [target methodSignatureForSelector:setter];
	NSAssert([sig numberOfArguments]==3, @"Invalid TKCellAttribute selector signature");
	NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
	[inv setTarget:target];
	[inv setSelector:setter];
	[inv setArgument:argument atIndex:2];
	[inv invoke];
}

-(void) apply:(id)target value:(id)v
{
}

-(void) apply:(id)target
{
}

-(id) getRollbackValue:(id)target
{
	return nil;
}


@end



@implementation TKCellObjectAttribute

-(id) initWithAccessor:(SEL)accessorSelector getter:(SEL)getterSelector setter:(SEL)setterSelector value:(NSObject*)value
{
	self = [super init];
	if(self) 
	{
		accessor = accessorSelector;
		getter = getterSelector;
		setter = setterSelector;
		objectValue = value;
	}
	return self;
}

-(void) apply:(id)target value:(id)v
{
	id a = ( v!=[NSNull null] ? v : nil );
	[self invokeOnTarget:target withArgument:&a];
}


-(void) apply:(id)target
{
	[self invokeOnTarget:target withArgument:&objectValue];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

-(id) getRollbackValue:(id)target
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellObjectAttribute accessor");
		target = [target performSelector:accessor];
		if(!target) {
			return nil; // accessor returns nil if property isn't initialized, for ex. cell.imageView might be nil
		}
	}
	NSAssert([target respondsToSelector:getter], @"Unresponded TKCellObjectAttribute selector");
	id v = [target performSelector:getter];

	return v ? v : [NSNull null];
}

#pragma clang diagnostic pop

@end



@implementation TKCellScalarAttribute

-(id) initWithAccessor:(SEL)accessorSelector getter:(SEL)getterSelector setter:(SEL)setterSelector value:(void*)value
{
	self = [super init];
	if(self) 
	{
		accessor = accessorSelector;
		getter = getterSelector;
		setter = setterSelector;
		scalarValue = *(int*)value;
	}
	return self;
}


-(void) apply:(id)target value:(id)v
{
	void* a = [v pointerValue];
	[self invokeOnTarget:target withArgument:&a];
}

-(void) apply:(id)target
{
	[self invokeOnTarget:target withArgument:&scalarValue];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

-(id) getRollbackValue:(id)target
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellScalarAttribute accessor");
		target = [target performSelector:accessor];
	}
	NSAssert([target respondsToSelector:getter], @"Unresponded TKCellScalarAttribute selector");
	void* v = (__bridge void*)[target performSelector:getter];
	
	return [NSValue valueWithPointer:v];
}

#pragma clang diagnostic pop

@end




@implementation TKRollbackArribute

-(id) init
{
	self = [super init];
	if(self)
	{
		attributes = [[NSMutableArray alloc] initWithCapacity:3];
		values = [[NSMutableArray alloc] initWithCapacity:3];
	}
	return self;
}

-(void) clean
{
	[attributes removeAllObjects];
	[values removeAllObjects];
}

-(void) addAttribute:(TKCellAttribute*)attr withRollbackValue:(id)v
{
	[attributes addObject:attr];
	[values addObject:v];
}

-(void) apply:(id)target
{
	for(int i=0; i<[attributes count]; i++)
	{
		TKCellAttribute* attr = [attributes objectAtIndex:i];
		id v = [values objectAtIndex:i];
		[attr apply:target value:v];
	}
}

@end









