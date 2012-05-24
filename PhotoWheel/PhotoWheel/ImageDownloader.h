//
//  ImageDownloaderClass.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ImageDownloaderCompletionBlock)(UIImage *image, NSError *); // 1
@interface ImageDownloader : NSObject
@property (nonatomic, strong, readonly) UIImage *image; // 2
- (void)downloadImageAtURL:(NSURL *)URL
                completion:(ImageDownloaderCompletionBlock)completion; // 3
@end
