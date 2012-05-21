//
//  WheelView.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WheelViewDataSource;
@class WheelViewCell;
typedef enum {
    WheelViewStyleWheel,
    WheelViewStyleCarousel, //旋转木马
} WheelViewStyle;

@interface WheelView : UIView
@property (nonatomic, strong) IBOutlet id<WheelViewDataSource> dataSource;
//Listing 10.6
@property (nonatomic, assign) WheelViewStyle style;
@end

@protocol WheelViewDataSource <NSObject>
@required
- (NSInteger)wheelViewNumberOfCells:(WheelView *) wheelView;
- (WheelViewCell *)wheelView:(WheelView *)wheelView cellAtIndex:(NSInteger)index;
@end

@interface WheelViewCell : UIView
@end