//
//  NavigationMenuTableViewCell.h
//  PulkitRohilla
//
//  Created by Pulkit Rohilla on 23/12/14.
//  Copyright (c) 2014 Pulkit Rohilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationMenuTableViewCell : UITableViewCell{
    
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UILabel *lblIcon;
}

- (void)setupCellWithTitle:(NSString *)title andIcon:(NSString *)icon;

@end
