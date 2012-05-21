//
//  Photo.h
//  PhotoWheelPrototype
//
//  Created by Lion User on 21/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "_Photo.h"

@interface Photo : _Photo
- (void)saveImage:(UIImage *)newImage;
- (UIImage *)originalImage;
- (UIImage *)largeImage;
- (UIImage *)thumbnailImage;
@end
