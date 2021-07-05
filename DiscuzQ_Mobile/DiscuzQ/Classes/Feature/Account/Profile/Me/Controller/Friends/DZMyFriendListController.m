//
//  DZMyFriendListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//  我的粉丝 我的关注

#import "DZMyFriendListController.h"
#import "DZMyFollowListController.h"
#import "DZContainerController.h"
#import "DZMyFansListController.h"

@interface DZMyFriendListController ()

@property (nonatomic, assign) NSInteger index;  //!< 属性注释
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) DZContainerController *rootVC;

@end

@implementation DZMyFriendListController

- (instancetype)initWithUser:(NSString *)user_id index:(NSInteger)index
{
    self = [super init];
    if (self) {
        self.index = index;
        self.user_id = checkNull(user_id);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"好友列表";
    [self config_FriendListCtrl];
    
    [self.rootVC.segmentControl setSelectedSegmentIndex:self.index animated:NO];
}

-(void)config_FriendListCtrl{
    
    CGFloat listHeight = KScreenHeight - KNavi_ContainStatusBar_Height - kToolBarHeight;
    DZMyFollowListController *followVC = [[DZMyFollowListController alloc] init];
    followVC.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    [followVC.dz_NavigationBar removeFromSuperview];
    followVC.title = @"关注";
    
    DZMyFansListController *fansVC = [[DZMyFansListController alloc] init];
    fansVC.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    [fansVC.dz_NavigationBar removeFromSuperview];
    fansVC.title = @"粉丝";
    
    NSArray *targetVCArr = @[followVC,fansVC];
    self.rootVC = [[DZContainerController alloc] init];
    CGRect segmentRect = CGRectMake(0, 0, KScreenWidth, kToolBarHeight);
    self.view.height = KScreenHeight - KNavi_ContainStatusBar_Height;
    [self.rootVC configSubControllers:targetVCArr parentVC:self segmentRect:segmentRect];
    
}



@end






