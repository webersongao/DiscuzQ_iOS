//
//  DZMyFollowListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyFollowListController : DZBaseViewController

- (instancetype)initWithUserid:(NSString *)user_id;

@property (nonatomic, strong) UITableView *listView;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
