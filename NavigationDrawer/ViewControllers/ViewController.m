//
//  ViewController.m
//  NavigationDrawer
//
//  Created by Pulkit Rohilla on 16/12/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import "ViewController.h"

#import "SlideMenuViewController.h"

#import "NavigationMenu.h"
#import "FrontViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionLogin:(UIButton *)sender {
    
    NavigationMenu *menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationMenu"];
    
    UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"CommonNavController"];
    
    FrontViewController *frontViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"FrontViewController"];
    [navController setViewControllers:@[frontViewController]];
    
    SlideMenuViewController *slideMenuController = [[SlideMenuViewController alloc] initSlideMenuWithFront:navController andRear:menuVC];
    
    [self presentViewController:slideMenuController animated:YES completion:nil];
}

@end
