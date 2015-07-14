//
//  DetailViewController.h
//  CellHeightDemo
//
//  Created by 张猛 on 15-7-14.
//  Copyright (c) 2015年 Mn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *cellButton;

@end

