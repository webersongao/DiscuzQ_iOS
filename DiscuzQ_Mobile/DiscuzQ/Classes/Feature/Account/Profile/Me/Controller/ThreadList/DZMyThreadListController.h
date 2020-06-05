//
//  MyTopicViewController.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZMyThreadListView.h"

@interface DZMyThreadListController : DZBaseViewController

@property (nonatomic, strong) DZMyThreadListView *listView;  //!< 属性注释
- (instancetype)initWithUserid:(NSString *)user_id;

@end
