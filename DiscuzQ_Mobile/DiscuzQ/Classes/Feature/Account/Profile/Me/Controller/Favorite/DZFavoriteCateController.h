//
//  DZFavoriteCateController.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZFavoriteCateController : DZBaseViewController

@property (nonatomic, strong) UITableView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;

@end
