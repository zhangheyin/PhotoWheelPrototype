//
//  PhotoWheelView.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WheelView.h"
@interface PhotoWheelViewCell : WheelViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *label;
+ (PhotoWheelViewCell *)photoWheelViewCell;
@end