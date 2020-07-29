//
//  DZMyFollowListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZMyUserListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyFollowListController : DZBaseViewController

- (instancetype)initWithUserid:(NSString *)user_id;

@property (nonatomic, strong) DZMyUserListView *listView;  //!< 属性注释

-(void)first_LoadUserFollowListViewData;


@end

NS_ASSUME_NONNULL_END
