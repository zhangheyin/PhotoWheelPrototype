//
//  NameEditorViewController.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NameEditorViewController.h"

@implementation NameEditorViewController
/*ADD---  ---ADD*/
@synthesize nameTextField = _nameTextField;
@synthesize delegate = _delegate;
@synthesize indexPath = _indexPath;
@synthesize defaultNameText = _defaultNameText;
/*ADD---  ---ADD*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([self isEditing]) {
        [[self nameTextField] setText:[self defaultNameText]];
    }
}

- (void)viewDidUnload
{
    /*ADD---  ---ADD*/
    [self setNameTextField:nil];
    /*ADD---  ---ADD*/
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

-(id) initWithDefaultNib
{
    self = [super initWithNibName:@"NameEditorViewController" bundle:nil];
    if (self) {
        //
    }
    return self;
}

#pragma mark - Actions methods
- (IBAction)cancel:(id)sender
{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    if (delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidCancel:)])
    {
        [delegate nameEditorViewControllerDidCancel:self];
    }
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)done:(id)sender
{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    if( delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidFinish:)])
    {
        [delegate nameEditorViewControllerDidFinish:self];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
