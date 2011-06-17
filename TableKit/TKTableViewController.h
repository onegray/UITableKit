//
//  TKTableViewController.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKTableViewController : UITableViewController
{
    NSArray* sections;
}

@property (nonatomic, retain) NSArray* sections;

@end
