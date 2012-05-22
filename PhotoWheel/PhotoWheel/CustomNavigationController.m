//
//  CustomNavigationController.m
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomNavigationController.h"
#import "UIView+PWCategory.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *sourceViewController = [self topViewController];
    // Animates image snapshot of the view
    UIView *sourceView = [sourceViewController view];
    UIImage *sourceViewImage = [sourceView pw_imageSnapshot];
    UIImageView *sourceImageView = [[UIImageView alloc]
                                    initWithImage:sourceViewImage];
    NSArray *viewControllers = [self viewControllers];
    NSInteger count = [viewControllers count];
    NSInteger index = count - 2;
    UIViewController *destinationViewController;
    destinationViewController = [viewControllers objectAtIndex:index];
    UIView *destinationView = [destinationViewController view];
    UIImage *destinationViewImage = [destinationView pw_imageSnapshot];
    UIImageView *destinationImageView = [[UIImageView alloc]
                                         initWithImage:destinationViewImage];
    [super popViewControllerAnimated:NO];
    [destinationView addSubview:destinationImageView];
    [destinationView addSubview:sourceImageView];
    CGRect frame = [destinationView frame];
    CGPoint shrinkToPoint = CGPointMake(frame.size.width / 2,
                                        frame.size.height / 2);
    void (^animations)(void) = ^ {
        [sourceImageView setFrame:CGRectMake(shrinkToPoint.x,
                                             shrinkToPoint.y,
                                             0,
                                             0)];
        [sourceImageView setAlpha:0.0];
        // Animate the nav bar too
        UINavigationBar *navBar = [self navigationBar];
        [navBar setFrame:CGRectOffset(navBar.frame, 0, -navBar.frame.size.height)];
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        [self setNavigationBarHidden:YES];
        // Reset the nav bar position
        UINavigationBar *navBar = [self navigationBar];
        [navBar setFrame:CGRectOffset(navBar.frame, 0, navBar.frame.size.height)];
        [sourceImageView removeFromSuperview];
        [destinationImageView removeFromSuperview];
    };
    [UIView transitionWithView:destinationView
                      duration:0.3
                       options:UIViewAnimationOptionTransitionNone
                    animations:animations
                    completion:completion];
    return sourceViewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
