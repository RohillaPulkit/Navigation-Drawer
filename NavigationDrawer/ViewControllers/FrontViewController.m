//
//  FrontViewController.m
//  NavigationDrawer
//
//  Created by Pulkit Rohilla on 16/12/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import "FrontViewController.h"
#import "SlideMenuViewController.h"

@interface FrontViewController ()

@end

@implementation FrontViewController{
    
        UIBarButtonItem *barBtnNavigation;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupNavigationBar{
    
    barBtnNavigation = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navIcon"] style:UIBarButtonItemStylePlain target:self.menuViewController action:@selector(toggleSlideMenu)];
    [barBtnNavigation setTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setLeftBarButtonItem:barBtnNavigation];
    [self.navigationItem setTitle:@"Navigation Drawer"];
}

-(void)logOut{

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
