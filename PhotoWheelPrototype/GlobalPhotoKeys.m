//
//  GlobalPhotoKeys.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlobalPhotoKeys.h"
// Keys for photo albums
const NSString *kPhotoAlbumNameKey = @"name";
const NSString *kPhotoAlbumDateAddedKey = @"dateAdded";
const NSString *kPhotoAlbumPhotosKey = @"photos";

// File name where the photo album is stored
const NSString *kPhotoAlbumFileName = @"photoAlbums.plist";

// Keys for individual photos
const NSString *kPhotoDataKey = @"photoData";
const NSString *kPhotoDateAddedKey = @"dateAdded";
const NSString *kPhotoFilenameKey = @"filename";

// Notification that a new photo has been added and the album needs to be saved
const NSString *kPhotoAlbumSaveNotification = @"save albums notification";
