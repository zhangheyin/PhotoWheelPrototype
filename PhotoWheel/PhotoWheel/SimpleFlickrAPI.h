//
//  SimpleFlickrAPI.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface SimpleFlickrAPI : NSObject
// Returns a set of photos matching the search string.
- (NSArray *)photosWithSearchString:(NSString *)string;
// Returns the Flickr NSID for the given user name.
- (NSString *)userIdForUsername:(NSString *)username;
// Returns a Flickr photo set for the user. userId is the Flickr NSID
// of the user.
- (NSArray *)photoSetListWithUserId:(NSString *)userId;
// Returns the photos for a Flickr photo set.
- (NSArray *)photosWithPhotoSetId:(NSString *)photoSetId;
@end
