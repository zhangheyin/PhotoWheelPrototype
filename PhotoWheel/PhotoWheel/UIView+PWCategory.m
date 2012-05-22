//
//  UIView+PWCategory.m
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView+PWCategory.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (PWCategory)
- (UIImage *)pw_imageSnapshot
{
    UIGraphicsBeginImageContext([self bounds].size);
    [[self layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end