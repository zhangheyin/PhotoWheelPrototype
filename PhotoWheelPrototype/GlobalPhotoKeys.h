//
//  GlobalPhotoKeys.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// Keys for photo albums
extern NSString *kPhotoAlbumNameKey;
extern NSString *kPhotoAlbumDateAddedKey;
extern NSString *kPhotoAlbumPhotosKey;

// File name where the photo album is stored
extern NSString *kPhotoAlbumFileName;

// Keys for individual photos
extern NSString *kPhotoDataKey;
extern NSString *kPhotoDateAddedKey;
extern NSString *kPhotoFilenameKey;

// Notification that a new photo has been added and the album needs to be saved
extern NSString *kPhotoAlbumSaveNotification;
