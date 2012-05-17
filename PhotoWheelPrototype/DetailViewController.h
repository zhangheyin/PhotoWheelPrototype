//
//  DetailViewController.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WheelView.h"
@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, WheelViewDataSource>
@property (strong, nonatomic) IBOutlet WheelView *wheelview;
@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
