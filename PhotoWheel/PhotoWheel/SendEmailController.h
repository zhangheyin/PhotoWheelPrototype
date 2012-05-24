//
//  SendEmailController.h
//  PhotoWheel
//
//  Created by Lion User on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
@protocol SendEmailControllerDelegate;
@interface SendEmailController : NSObject <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) UIViewController<SendEmailControllerDelegate>
*viewController;
@property (nonatomic, strong) NSSet *photos;
- (id)initWithViewController:(UIViewController<SendEmailControllerDelegate> *)
viewController;
- (void)sendEmail;
+ (BOOL)canSendMail;
@end
@protocol SendEmailControllerDelegate <NSObject>
@required
- (void)sendEmailControllerDidFinish:(SendEmailController *)controller;
@end
