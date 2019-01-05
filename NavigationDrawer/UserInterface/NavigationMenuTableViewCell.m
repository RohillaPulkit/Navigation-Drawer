//
//  NavigationMenuTableViewCell.m
//  PulkitRohilla
//
//  Created by Pulkit Rohilla on 23/12/14.
//  Copyright (c) 2014 Pulkit Rohilla. All rights reserved.
//

#import "NavigationMenuTableViewCell.h"

@implementation NavigationMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    
    frame.origin.x = 0;
    frame.size.width = 150;
    [super setFrame:frame];
}

-(void)setupCellWithTitle:(NSString *)title andIcon:(NSString *)icon{
    
    lblTitle.text = title;
    lblIcon.text = icon;
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor darkGrayColor];
    [self setSelectedBackgroundView:bgColorView];
}
@end
