//
//  AppDelegate.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *splitViewController;

//Listing 13.14 Core Data Code for PhotoWheelPrototypeAppDelegate.h
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//Listing 13.14 Core Data Code for PhotoWheelPrototypeAppDelegate.h
@end
