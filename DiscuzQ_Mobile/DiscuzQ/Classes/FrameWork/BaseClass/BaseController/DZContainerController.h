//
//  TTContainerController.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/4/23.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZSegmentedControl.h"

@interface DZContainerController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, assign) BOOL sendNotify;
@property (nonatomic,strong) UIColor *naviBackColor;

@property (nonatomic, weak) UIViewController *parentController;
@property (strong, nonatomic) DZSegmentedControl *segmentControl;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) UITableViewController *currentCtrl;

@property (strong, nonatomic) NSArray <UITableViewController *>*tableControllers;

- (void)configSubControllers:(NSArray<UITableViewController *>*)subControllers parentVC:(UIViewController *)parentVC segmentRect:(CGRect)segmentRect;

@end
