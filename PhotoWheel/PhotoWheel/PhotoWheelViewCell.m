//
//  PhotoWheelView.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoWheelViewCell.h"
@implementation PhotoWheelViewCell
@synthesize imageView = _imageView;
@synthesize label = _label;

+ (PhotoWheelViewCell *)photoWheelViewCell
{
    NSString *nibName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
    // Verify that the top-level object is in fact of the correct type.
    NSAssert2([nibObjects count] > 0 &&
              [[nibObjects objectAtIndex:0] isKindOfClass:[self class]],
              @"Nib '%@' does not contain top-level view of type %@.",
              nibName, nibName);
    return [nibObjects objectAtIndex:0];
}
@end