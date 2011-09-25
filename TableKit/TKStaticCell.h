//
//  TKStaticCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKCell.h"

@interface TKStaticCell : TKCell
{
    NSString* title;
}

@property (nonatomic, retain) NSString* title;

+(TKStaticCell*) cellWithTitle:(NSString*)title;
-(id) initWithTitle:(NSString*)title;

-(void) setFont:(UIFont*)font;
-(void) setTextColor:(UIColor*)color;

@end
