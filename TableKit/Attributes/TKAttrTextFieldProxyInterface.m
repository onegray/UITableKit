//
//  TKAttrTextFieldProxy.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/21/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
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

#import "TKAttrTextFieldProxyInterface.h"
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrTextFieldProxyInterface)
+(TKAttrTextFieldProxyInterface*) sharedTextFieldProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@implementation TKAttrProxy(TKAttrTextFieldProxyInterface)

+(TKAttrTextFieldProxyInterface*) sharedTextFieldProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes
{
	static TKAttrProxy* sharedProxy = nil;
	if(!sharedProxy)
	{
		sharedProxy = [[TKAttrProxy alloc] initWithTargetClass:[UITextField class]];
	}
	return (TKAttrTextFieldProxyInterface*)[sharedProxy prepareWithAccessor:accessor attributes:attributes];
}

@end



@implementation TKAttrTextFieldProxyInterface

@dynamic enabled;
@dynamic selected;
@dynamic highlighted;

@dynamic textColor;
@dynamic font;
@dynamic textAlignment;
@dynamic borderStyle;
@dynamic clearsOnBeginEditing;
@dynamic adjustsFontSizeToFitWidth;
@dynamic minimumFontSize;
@dynamic delegate;
@dynamic background;
@dynamic disabledBackground;
@dynamic clearButtonMode;
@dynamic leftView;
@dynamic leftViewMode;
@dynamic rightView;
@dynamic rightViewMode;
@dynamic inputView;
@dynamic inputAccessoryView;

@dynamic autocapitalizationType;
@dynamic autocorrectionType;
@dynamic spellCheckingType;
@dynamic keyboardType;
@dynamic keyboardAppearance;
@dynamic returnKeyType;
@dynamic enablesReturnKeyAutomatically;
@dynamic secureTextEntry;

@dynamic onDidBeginEditingHandler;
@dynamic onDidEndEditingHandler;
@dynamic onDidChangeHandler;

@end


@implementation UITextField(standard_getters)

-(BOOL) enabled 
{
	return [self isEnabled];
}

-(BOOL) selected 
{
	return [self isSelected];
}

-(BOOL) highlighted 
{
	return [self isHighlighted];
}

-(BOOL) secureTextEntry 
{
	return [self isSecureTextEntry];
}

@end


#import <objc/runtime.h>

@implementation UITextField(handlers)

-(void) setOnDidBeginEditingHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidBeginEditingHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidBeginEditingHandler
{
	return objc_getAssociatedObject(self, @selector(onDidBeginEditingHandler));
}

-(void) setOnDidEndEditingHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidEndEditingHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidEndEditingHandler
{
	return objc_getAssociatedObject(self, @selector(onDidEndEditingHandler));
}

-(void) setOnDidChangeHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidChangeHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidChangeHandler
{
	return objc_getAssociatedObject(self, @selector(onDidChangeHandler));
}

@end



