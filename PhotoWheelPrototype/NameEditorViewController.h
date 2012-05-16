//
//  NameEditorViewController.h
//  PhotoWheelPrototype
//
//  Created by Heyin Zhang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/*ADD---  ---ADD*/
@protocol NameEditorViewControllerDelegate;
@interface NameEditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) id<NameEditorViewControllerDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSString *defaultNameText;
-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
-(id)initWithDefaultNib;
/*ADD---  ---ADD*/
@end

/*ADD---  ---ADD*/
@protocol NameEditorViewControllerDelegate <NSObject>

-(void) nameEditorViewControllerDidFinish:(NameEditorViewController *)controller;
-(void) nameEditorViewControllerDidCancel:(NameEditorViewController *)controller;
/*ADD---  ---ADD*/
@end