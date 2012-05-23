//
//  MainViewController.m
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "PhotoAlbumViewController.h"
#import "PhotoAlbumsViewController.h"
#import "AppDelegate.h"
@implementation MainViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate =
    (AppDelegate *)[[UIApplication sharedApplication] delegate]; // 1
    NSManagedObjectContext *managedObjectContext =
    [appDelegate managedObjectContext]; // 2
    UIStoryboard *storyboard = [self storyboard];
    PhotoAlbumsViewController *photoAlbumsScene =
    [storyboard instantiateViewControllerWithIdentifier:@"PhotoAlbumsScene"];
    [photoAlbumsScene setManagedObjectContext:managedObjectContext]; // 3
    [self addChildViewController:photoAlbumsScene];
    [photoAlbumsScene didMoveToParentViewController:self];
    PhotoAlbumViewController *photoAlbumScene =
    [storyboard instantiateViewControllerWithIdentifier:@"PhotoAlbumScene"];
    [self addChildViewController:photoAlbumScene];
    [photoAlbumScene didMoveToParentViewController:self];
    
    [photoAlbumsScene setPhotoAlbumViewController:photoAlbumScene];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
