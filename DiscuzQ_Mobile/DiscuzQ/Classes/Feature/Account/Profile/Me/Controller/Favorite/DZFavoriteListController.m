//
//  DZFavoriteListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteListController.h"
#import "DZFavoriteCateController.h"
#import "DZFavoriteThreadController.h"
#import "DZContainerController.h"

@interface DZFavoriteListController ()

@property (nonatomic, assign) NSInteger index;  //!< 属性注释
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) DZContainerController *rootVC;

@end

@implementation DZFavoriteListController

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
    
    self.title = @"我的收藏";
    [self config_FavoriteListCtrl];
}


-(void)config_FavoriteListCtrl{
    
    CGFloat listHeight = KScreenHeight - KNavi_ContainStatusBar_Height - kToolBarHeight;
    DZFavoriteThreadController *threadVC = [[DZFavoriteThreadController alloc] initWithUserid:self.user_id];
    threadVC.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    [threadVC.dz_NavigationBar removeFromSuperview];
    threadVC.title = @"主题";
    
    DZFavoriteCateController *CateVC = [[DZFavoriteCateController alloc] initWithUserid:self.user_id];
    CateVC.listView.frame = CGRectMake(0, 0, KScreenWidth, listHeight);
    [CateVC.dz_NavigationBar removeFromSuperview];
    CateVC.title = @"版块";
    
    NSArray *targetVCArr = @[threadVC,CateVC];
    self.rootVC = [[DZContainerController alloc] init];
    CGRect segmentRect = CGRectMake(0, 0, KScreenWidth, kToolBarHeight);
    self.view.height = KScreenHeight - KNavi_ContainStatusBar_Height;
    [self.rootVC configSubControllers:targetVCArr parentVC:self segmentRect:segmentRect];
    
}

@end
