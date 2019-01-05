//
//  SlideMenuViewController.h
//  PulkitRohilla
//
//  Created by Pulkit Rohilla on 31/03/15.
//  Copyright (c) 2015 Pulkit Rohilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuViewController : UIViewController

@property (readonly,nonatomic) UISwipeGestureRecognizer  *recognizer_close;

-(void)toggleSlideMenu;
-(void)closeSlideMenu;

-(id)initSlideMenuWithFront:(UIViewController*)frontController andRear:(UIViewController *)rearController;

@property (strong) UIViewController *frontViewController, *rearViewController;

@end

#pragma mark - UIViewController(SlideMenuViewController) Category

@class SlideMenuViewController;

@interface UIViewController(SlideMenuViewController)

- (SlideMenuViewController *)menuViewController;

@end
