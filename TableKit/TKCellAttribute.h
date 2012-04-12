//
//  TKCellAttribute.h
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

#import <Foundation/Foundation.h>

@interface TKCellAttribute : NSObject
{
	SEL getter;
	SEL setter;
	SEL accessor;
}
@property (nonatomic, assign) SEL getter;
@property (nonatomic, assign) SEL setter;
@property (nonatomic, assign) SEL accessor;

-(void) apply:(id)target;
-(void) apply:(id)target value:(id)v;

-(id) getRollbackValue:(id)target;

@end


@interface TKCellObjectAttribute : TKCellAttribute
{
	NSObject* objectValue;
}

-(id) initWithAccessor:(SEL)accessorSelector getter:(SEL)getterSelector setter:(SEL)setterSelector value:(NSObject*)value;
-(void) apply:(id)target;

@end


@interface TKCellScalarAttribute : TKCellAttribute
{
	int scalarValue;
}

-(id) initWithAccessor:(SEL)accessorSelector getter:(SEL)getterSelector setter:(SEL)setterSelector value:(void*)value;
-(void) apply:(id)target;

@end


@interface TKRollbackArribute : TKCellAttribute
{
	NSMutableArray* attributes;
	NSMutableArray* values;
}

-(void) clean;

-(void) addAttribute:(TKCellAttribute*)attr withRollbackValue:(NSValue*)v;

@end






