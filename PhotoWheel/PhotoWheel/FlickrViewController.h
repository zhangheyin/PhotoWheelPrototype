//
//  FlickrViewController.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridView.h"
@interface FlickrViewController : UIViewController <GridViewDataSource,
UISearchBarDelegate>
@property (nonatomic, strong) IBOutlet GridView *gridView;
@property (nonatomic, strong) IBOutlet UIView *overlayView;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectID *objectID;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
@end
