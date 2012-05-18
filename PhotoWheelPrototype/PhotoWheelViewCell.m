//
//  PhotoWheelView.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoWheelViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation PhotoWheelViewCell

//Listing 10.13
- (void) setImage:(UIImage *)newImage
{
    //add the image to the layer's contents.
    CALayer *layer = [self layer];
    id imageRef = (__bridge id)[newImage CGImage];
    [layer setContents:imageRef];
    
    //add border and shadow
    [layer setBorderColor:[UIColor colorWithWhite:1.f alpha:1.f].CGColor];
    [layer setBorderWidth:5.f];
    [layer setShadowOffset:CGSizeMake(0, 3)];
    [layer setShadowOpacity:.7f];
    [layer setShouldRasterize:YES];
}	

@end
