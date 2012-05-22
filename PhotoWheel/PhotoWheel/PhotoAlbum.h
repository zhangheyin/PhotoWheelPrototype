//
//  PhotoAlbum.h
//  PhotoWheelPrototype
//
//  Created by Lion User on 21/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "_PhotoAlbum.h"

@interface PhotoAlbum : _PhotoAlbum
+ (NSMutableArray *)allPhotoAlbumsInContext:(NSManagedObjectContext *)context;
+ (PhotoAlbum *)newPhotoAlbumWithName:(NSString *)albumName
                            inContext:(NSManagedObjectContext *)context;
@end
