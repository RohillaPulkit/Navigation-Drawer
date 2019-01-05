//
//  SlideMenuViewController.m
//  PulkitRohilla
//
//  Created by Pulkit Rohilla on 31/03/15.
//  Copyright (c) 2015 Pulkit Rohilla. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController{
    
    CGFloat menuDrawerWidth;
    
    BOOL menuIsOpen;
    
    UIView *transparentView;

}

const int slideMenuInitialPoint = 25 ;
const int slideAnimationDuration = -5 ;
const int slideMenuWidth = 150;

@synthesize recognizer_close,frontViewController,rearViewController;

-(id)initSlideMenuWithFront:(UIViewController *)frontController andRear:(UIViewController *)rearController{
    
    self = [super init];
    
    if (self) {
        
        frontViewController = frontController;
        rearViewController = rearController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

    menuDrawerWidth = slideMenuWidth;
    menuIsOpen=false;

    [self addChildViewController:frontViewController];
    [self addChildViewController:rearViewController];
   
    //ShadowEffect
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 4, 5, frontViewController.view.layer.frame.size.height) cornerRadius:2];
    [frontViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [frontViewController.view.layer setShadowOpacity:1.0f];
    [frontViewController.view.layer setShadowRadius:2.0f];
    [frontViewController.view.layer setShadowPath:[path CGPath]];
    
    [self.view addSubview:frontViewController.view];
    [self.view addSubview:rearViewController.view];
    [self.view sendSubviewToBack:rearViewController.view];
    
    [rearViewController.view setFrame:CGRectMake(rearViewController.view.frame.origin.x-slideMenuInitialPoint, rearViewController.view.frame.origin.y + statusBarHeight, rearViewController.view.frame.size.width, rearViewController.view.frame.size.height)];

    recognizer_close = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(toggleSlideMenu)];
    [recognizer_close setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [rearViewController.view addGestureRecognizer:recognizer_close];
    
    transparentView = [[UIView alloc] initWithFrame:frontViewController.view.bounds];
    [transparentView setBackgroundColor:[UIColor clearColor]];
    
    [transparentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];

    self.view.backgroundColor = rearViewController.view.backgroundColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Other Methods

-(void)toggleSlideMenu{
    
    if ( !menuIsOpen) {
        
        [self openSlideMenu];
        
    }
    else if (menuIsOpen  && frontViewController.view.frame.origin.x > 0 )
    {
        [self closeSlideMenu];
    }
}

-(void)closeSlideMenu{
    
    [UIView animateWithDuration:slideAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        frontViewController.view.frame = CGRectMake(frontViewController.view.frame.origin.x - menuDrawerWidth,frontViewController.view.frame.origin.y, frontViewController.view.frame.size.width, frontViewController.view.frame.size.height);
        
        [rearViewController.view setFrame:CGRectMake(rearViewController.view.frame.origin.x-slideMenuInitialPoint, rearViewController.view.frame.origin.y , rearViewController.view.frame.size.width, rearViewController.view.frame.size.height)];
    
        [transparentView removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
        menuIsOpen = false;
        
    }];
    
}

-(void)openSlideMenu{
    
    [UIView animateWithDuration:slideAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        frontViewController.view.frame = CGRectMake(frontViewController.view.frame.origin.x + menuDrawerWidth,frontViewController.view.frame.origin.y, frontViewController.view.frame.size.width, frontViewController.view.frame.size.height);
        
        [rearViewController.view setFrame:CGRectMake(rearViewController.view.frame.origin.x+slideMenuInitialPoint, rearViewController.view.frame.origin.y , rearViewController.view.frame.size.width, rearViewController.view.frame.size.height)];
        
        [frontViewController.view addSubview:transparentView];
        
    } completion:^(BOOL finished) {
        
        menuIsOpen = true;
        
    }];
}


#pragma mark - Handle Touch

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (menuIsOpen) {
        
        [self toggleSlideMenu];
        
        return;
    }
    
    return;
}

@end

#pragma mark - UIViewController(ViewController) Category

@implementation UIViewController(SlideMenuViewController)

- (SlideMenuViewController *)menuViewController
{
    UIViewController *parent = self.parentViewController;
    Class slideMenuClass = [SlideMenuViewController class];
    
    if ([parent isKindOfClass:slideMenuClass]) {
        
        return (id)parent;
    }
    else{
        
        while ( nil != (parent = [parent parentViewController]) && ![parent isKindOfClass:slideMenuClass] )
        {
            
        }
    }
    return (id)parent;
}


@end
