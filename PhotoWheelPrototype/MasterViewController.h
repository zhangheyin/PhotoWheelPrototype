//
//  MasterViewController.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameEditorViewController.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController<NameEditorViewControllerDelegate>


@property (strong, nonatomic) DetailViewController *detailViewController;

/*ADD--- FOR DATA ---ADD*/
@property (strong, nonatomic) NSMutableOrderedSet/* modify 288  NSMutableArray*/ *data; 
@end
