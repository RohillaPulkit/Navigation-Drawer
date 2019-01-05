//
//  NavigationMenu.m
//  PulkitRohilla
//
//  Created by Pulkit Rohilla on 18/12/14.
//  Copyright (c) 2014 Pulkit Rohilla. All rights reserved.
//

#import "NavigationMenu.h"
#import "SlideMenuViewController.h"
#import "NavigationMenuTableViewCell.h"
#import "FrontViewController.h"

@implementation NavigationMenu{
    
    NSArray *menuList,*menuIconList;
    
    UINavigationController *navigationController;
    FrontViewController *frontViewController;
}

#pragma mark - Constants
static NSString *const cellIdentifierDefault = @"cellIdentifier";
static float const menuCellHeight = 90;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuList=@[@"Home", @"User", @"Log Out"];
    menuIconList=@[@"", @"", @""];
    
    navigationController = (UINavigationController *)self.menuViewController.frontViewController;
    frontViewController = (FrontViewController *)navigationController.viewControllers.firstObject;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NavigationMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierDefault forIndexPath:indexPath];
    
    NSString *title = [menuList objectAtIndex:indexPath.row];
    NSString *icon = [menuIconList objectAtIndex:indexPath.row];
    
    [cell setupCellWithTitle:title andIcon:icon];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // if we are trying to push the same row or perform an operation that does not imply frontViewController replacement
    // we'll just set position and return
    SlideMenuViewController *slideController = self.menuViewController;
    
    int logoutIndex = (int) menuList.count-1; //Find IndexPaths from static array
    
    if (row == logoutIndex) {
        
        [slideController toggleSlideMenu];
        
        UIAlertController *logoutAlert = [UIAlertController alertControllerWithTitle:@"Navigation Drawer"
                                                                             message:@"Are you sure you want to logout?"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [logoutAlert addAction:[UIAlertAction actionWithTitle:@"No"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){}]];
        
        [logoutAlert addAction:[UIAlertAction actionWithTitle:@"Yes"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action){
                                                          
                                                          //LogOut from FrontViewController
                                                          [frontViewController logOut];
                                                      }]];
        
        [self presentViewController:logoutAlert animated:YES completion:nil];
    }
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return menuCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

@end
