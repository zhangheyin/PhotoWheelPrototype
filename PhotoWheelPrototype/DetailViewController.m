//
//  DetailViewController.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoWheelViewCell.h"
@interface DetailViewController ()
@property (strong, nonatomic) UIImagePickerController *imagePickerController;//Add Listing 12.4 page 278
@property (strong, nonatomic) UIActionSheet *actionSheet; //Add Listing 12.3 page 275
@property (strong, nonatomic) PhotoWheelViewCell *selectedPhotoWheelViewCell;//add Listing 12.1
@property (strong, nonatomic) NSArray *data; //Listing 10.4
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController
@synthesize imagePickerController = _imagePickerController; //Add Listing 12.4 page 278
@synthesize actionSheet = _actionSheet;
@synthesize selectedPhotoWheelViewCell = _selectedPhotoWheelViewCell; //add Listing 12.1
@synthesize data = _data;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize wheelview = _wheelview;

//Add Listing 12.4 page 278
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
        [self setImagePickerController:[[UIImagePickerController alloc] init]];
        [[self imagePickerController] setDelegate:self];
    }
    return self;
}
//Add Listing 12.4 page 278
//add Listing 12.1
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation 
                                duration:(NSTimeInterval)duration
{
    if ([self actionSheet]) {
        [[self actionSheet] dismissWithClickedButtonIndex:-1 animated:YES];
    }
}
//add Listing 12.1

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void) segmentedControlValueChanged:(id)sender
{
    NSInteger index = [sender selectedSegmentIndex];
    if (index == 0) {
        [[self wheelview] setStyle:WheelViewStyleWheel];
    } else {
        [[self wheelview] setStyle:WheelViewStyleCarousel];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [self configureView];
    //ADD Listing 10.11
    NSArray *segmentedItems = [NSArray arrayWithObjects:@"Wheel", @"Carousel", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedItems];
    [segmentedControl addTarget:self
                         action:@selector(segmentedControlValueChanged:)
               forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [[self navigationItem] setTitleView:segmentedControl];
    //ADD Listing 10.11   
    
    //Add Listing 10.14
    UIImage *defaultPhoto = [UIImage imageNamed:@"defaultPhoto.png"];
    //Add Listing 10.14
    CGRect cellFrame = CGRectMake(0, 0, 75, 75);
    NSInteger count = 10;
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSInteger index = 0; index < count; index++) {
        //commit at Listing 10.14 WheelViewCell *cell = [[WheelViewCell alloc] initWithFrame:cellFrame];
        //commit at Listing 10.14 [cell setBackgroundColor:[UIColor blueColor]];
        //Add Listing 10.14       
        PhotoWheelViewCell *cell = [[PhotoWheelViewCell alloc] initWithFrame:cellFrame];
        [cell setImage:defaultPhoto];
        //Add Listing 10.14
        //Add Listing 11.2 add a double-tap gesture to the cell
        UITapGestureRecognizer *doubleTap;
        doubleTap = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self 
                                            action:@selector(cellDoubleTapped:)];
        [doubleTap setNumberOfTapsRequired:2];
        [cell addGestureRecognizer:doubleTap];
        
        //Add Listing 11.2
        //Add Listing 11.1 add single - tap gesture to the cell
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] 
                                       initWithTarget:self 
                                                action:@selector(cellTapped:)];
      //  [tap requireGestureRecognizerToFail:doubleTap];
        [cell addGestureRecognizer:tap];
        //Add Listing 11.1
        [newArray addObject:cell];
    }
    [self setData:[newArray copy]];
}


//add Listing 12.2 Page 273
-(void) presentPhotoLibrary
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //Add Listing 12.5 Page280    
    [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    UIView *view = [self selectedPhotoWheelViewCell];
    CGRect rect = [view bounds];
    UIPopoverController *newPopoverController = 
    [[UIPopoverController alloc] initWithContentViewController:[self imagePickerController]];
    [newPopoverController presentPopoverFromRect:rect 
                                          inView:view 
                        permittedArrowDirections:UIPopoverArrowDirectionAny 
                                        animated:YES];
    [self setMasterPopoverController:newPopoverController];    
    //Add Listing 12.5 Page280
}

- (void) presentCamera
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //Add Listing 12.5 Page280
    //display the camera
    [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentModalViewController:[self imagePickerController] animated:YES];
    //Add Listing 12.5 Page280
}

- (void) presentPhotoPickerMenu
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //add Listing 12.3 page 276
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    [actionSheet setDelegate:self];
    [actionSheet addButtonWithTitle:@"Take Photo"];
    [actionSheet addButtonWithTitle:@"Choose from Library"];
    
    UIView *view = [self selectedPhotoWheelViewCell];
    CGRect rect = [view bounds];
    [actionSheet showFromRect:rect inView:view animated:YES];
    [self setActionSheet:actionSheet];
    //add Listing 12.3 page 276
}
    //add Listing 12.3 page 276
#pragma mark - UIActionSheetdelegate methods
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self presentCamera];
            break;
        case 1:
            [self presentPhotoLibrary];
            break;
    }
}
    //add Listing 12.3 page 276
    //add Listing 12.3 page 276
- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex 
{
    [self setActionSheet:nil];
}
    //add Listing 12.3 page 276
//add Listing 12.2 Page 273
- (void) cellTapped:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //ADD Listing 12.1
    [self setSelectedPhotoWheelViewCell:(PhotoWheelViewCell *)[recognizer view]]; 
  //add Listing 12.2 Page 273  
    BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (hasCamera) {
        [self presentPhotoPickerMenu];
    } else {
        [self presentPhotoLibrary];
    }
    //add Listing 12.2 Page 273
}
- (void) cellDoubleTapped:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Photo Albums", @"Photo Albums");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - WheelViewDataSource methods
//Listing 10.5
- (NSInteger)wheelViewNumberOfCells:(WheelView *)wheelView
{
    NSInteger count = [[self data] count];
    return count;
}

- (WheelViewCell *)wheelView:(WheelView *)wheelView cellAtIndex:(NSInteger)index
{
    WheelViewCell *cell = [[self data] objectAtIndex:index];
    return cell;
}

#pragma mark - UIImagePickerControllerDelegate method
//Add Listing 12.6 Page 281 responding to the UiimagePickerController Delegate Method
-(void) imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //if the popover controller is available.
    //assume the photo is selected from the library
    //and not from the camera.
    //ADD listing 12.7
    BOOL takenWithCamera = ([self masterPopoverController] == nil);
    //ADD listing 12.7

    //Dismiss the Popover Controller if available;
    //otherwiss dismiss the camera view/
    if ([self masterPopoverController]) {
        [[self masterPopoverController] dismissPopoverAnimated:YES];
        [self setMasterPopoverController:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
    
    //Retrieve and display the image.
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [[self selectedPhotoWheelViewCell] setImage:image];
    //ADD listing 12.7   Page 284
    if (takenWithCamera) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    //ADD listing 12.7   Page 284
}
//Add Listing 12.6 Page 281 
@end
