//
//  WheelView.m
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WheelView.h"
#import <QuartzCore/QuartzCore.h>
#import "SpinGestureRecongnizer.h"
//Add Listing 11.5
@interface WheelView()
@property (nonatomic, assign) CGFloat currentAngle;
@end
//Add Listing 11.5
@implementation WheelView
@synthesize dataSource = _dataSource;
@synthesize style = _style;
@synthesize currentAngle = _currentAngle;
//Add Listing 11.5
- (void) commonInit
{
    [self setCurrentAngle:.0f];
    SpinGestureRecongnizer *spin = [[SpinGestureRecongnizer alloc]
                                    initWithTarget:self
                                    action:@selector(spin:)];
    [self addGestureRecognizer:spin];
}
//Add Listing 11.5
//Add Listing 11.5
- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}   
//Add Listing 11.5
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
//Add Listing 11.5
//Add Listing 11.5
- (id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
//Add Listing 11.5
- (void) setAngle:(CGFloat)angle
{
    CGPoint center = CGPointMake(CGRectGetMidX([self bounds]), CGRectGetMidY([self bounds]));
    CGFloat radiusX = MIN([self bounds].size.width, [self bounds].size.height) * .35;
    CGFloat radiusY = radiusX;
    
    //ADD Listing 10.8
    if([self style] == WheelViewStyleCarousel){
        radiusY = radiusX * .3;
    }  
    //ADD Listing 10.8
    NSInteger cellCount = [[self dataSource] wheelViewNumberOfCells:self];
    
    float angleToAdd = 360.f / cellCount;
    
    for (NSInteger index = 0; index < cellCount; index++)  {
        WheelViewCell *cell = [[self dataSource] wheelView:self cellAtIndex:index];
        if ([cell superview] == nil) {
            [self addSubview:cell];
        }
        
        float angleInRadians = (angle + 180.f) * M_PI / 180.f;
        //get a position based on the angle
        float xPosition = center.x + (radiusX * sinf(angleInRadians)) - (CGRectGetWidth([cell frame]) / 2 );
        float yPosition = center.y + (radiusY * cosf(angleInRadians)) - (CGRectGetHeight([cell frame]) / 2 );
        
        //Add Listing 10.8
        float scale = .75f + .25f * (cosf(angleInRadians) + 1.);
        // Apply location and scale
        if ([self style] == WheelViewStyleCarousel) {
            [cell setTransform:CGAffineTransformScale(
                                CGAffineTransformMakeTranslation(xPosition, yPosition), 
                                                      scale, 
                                                      scale)];
            
            //tweak alpha using the same system as applied for scale.
            //this time with 0.3 as the minimum and a semicircle rage
            // of 0.5
            [cell setAlpha:(.3f + .5f * (cosf(angleInRadians) + 1.f))];
            
        } else {
            [cell setTransform:CGAffineTransformMakeTranslation(xPosition, yPosition)];
            [cell setAlpha:1.f];
        }
        
        [[cell layer] setZPosition:scale];
        
        //Add Listing 10.8
        
        
        //comment by Listing 10.8 [cell setTransform:CGAffineTransformMakeTranslation(xPosition, yPosition)];
        //work out what the next angle is going to be
        angle += angleToAdd;
    }
}
//Add Listing 11.5
- (void) layoutSubviews
{
    [self setAngle:[self currentAngle]];//COMMIT OUT LISTING 11.5];
}
//Add Listing 11.5
//Listing 10.7
- (void) setStyle:(WheelViewStyle)newStyle
{
    if (_style != newStyle) {
        _style = newStyle;
        [UIView beginAnimations:@"WheelViewStyleChange" context:nil];
        [self setAngle:[self currentAngle]];//COMMIT OUT LISTING 11.5];
        [UIView commitAnimations];
    }
}
//Add Listing 11.5
- (void)spin:(SpinGestureRecongnizer *)recognizer
{
    CGFloat angleInRadians = -[recognizer rotation];
    CGFloat degrees = 180.f * angleInRadians / M_PI; //radians to degrees;
    [self setCurrentAngle:[self currentAngle] + degrees];
    [self setAngle:[self currentAngle]];
}
//Add Listing 11.5
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end

@implementation WheelViewCell
@end
