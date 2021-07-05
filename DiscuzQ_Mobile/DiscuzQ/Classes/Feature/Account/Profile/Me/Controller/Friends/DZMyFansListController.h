//
//  DZMyFansListController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZMyUserListView.h"

@interface DZMyFansListController : DZBaseViewController


- (instancetype)initWithUserid:(NSString *)user_id;

@property (nonatomic, strong) DZMyUserListView *listView;  //!< 属性注释

-(void)first_LoadUserFollowListViewData;


@end

