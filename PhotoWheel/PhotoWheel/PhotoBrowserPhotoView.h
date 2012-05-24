//
//  PhotoBrowserPhotoView.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
@class PhotoBrowserViewController; // 1
@interface PhotoBrowserPhotoView : UIScrollView <UIScrollViewDelegate> // 2

@property (nonatomic, assign) NSInteger index; // 3
@property (nonatomic, weak) PhotoBrowserViewController
*photoBrowserViewController; // 4
- (void)setImage:(UIImage *)newImage; // 5
- (void)turnOffZoom; // 6
- (CGPoint)pointToCenterAfterRotation;
- (CGFloat)scaleToRestoreAfterRotation;
- (void)setMaxMinZoomScalesForCurrentBounds;
- (void)restoreCenterPoint:(CGPoint)oldCenter scale:(CGFloat)oldScale;
@end

