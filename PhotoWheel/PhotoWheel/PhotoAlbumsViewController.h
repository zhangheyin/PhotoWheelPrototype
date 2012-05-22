//
//  PhotoAlbumsViewController.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WheelView.h"
@interface PhotoAlbumsViewController : UIViewController
<NSFetchedResultsControllerDelegate, WheelViewDataSource, WheelViewDelegate>
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) IBOutlet WheelView *wheelView;
- (IBAction)addPhotoAlbum:(id)sender;
@end