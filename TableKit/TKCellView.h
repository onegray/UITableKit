//
//  TKCellView.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKCellView : UITableViewCell
{
	id owner;
}
@property (nonatomic, assign) id owner;

@end
