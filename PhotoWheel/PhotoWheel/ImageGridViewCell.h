//
//  ImageGridViewCell.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

///////
// ImageGridViewCell.h
///////
#import "GridView.h"
@interface ImageGridViewCell : GridViewCell
@property (nonatomic, strong, readonly) UIImageView *imageView; // 1
@property (nonatomic, strong, readonly) UIImageView *selectedIndicator; // 2


+ (ImageGridViewCell *)imageGridViewCellWithSize:(CGSize)size; // 3
- (id)initWithSize:(CGSize)size;
@end