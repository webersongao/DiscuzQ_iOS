//
//  DZMyFansListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZMyFansListController : DZBaseViewController

@property (nonatomic, strong) UITableView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;


@end

