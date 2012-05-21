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
//Add a new managed object property to MasterViewController.h: page 307
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//Add a new managed object property to MasterViewController.h: page 307
/*ADD--- FOR DATA ---ADD*/
@property (strong, nonatomic) NSMutableArray *data; 
@end
