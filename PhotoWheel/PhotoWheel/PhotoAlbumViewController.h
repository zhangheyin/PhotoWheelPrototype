//
//  PhotoAlbumViewController.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GridView.h"
#import "PhotoBrowserViewController.h"
@interface PhotoAlbumViewController : UIViewController <UIActionSheetDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, GridViewDataSource,PhotoBrowserViewControllerDelegate, SendEmailControllerDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) IBOutlet UIImageView *shadowImageView;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectID *objectID;

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, strong) IBOutlet GridView *gridView;
// Other code left out for brevity's sake.


- (void)reload;

- (IBAction)showActionMenu:(id)sender;
- (IBAction)addPhoto:(id)sender;
- (UIImage *)selectedImage;
- (CGRect)selectedCellFrame;
@end
