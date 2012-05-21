//
//  SpinGestureRecongnizer.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpinGestureRecongnizer : UIGestureRecognizer
//the ratation of the gesture in radians since its last change.
@property (nonatomic, assign) CGFloat rotation;
@end
