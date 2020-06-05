//
//  DZFavoriteListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteListController.h"
#import "DZFavoriteCateController.h"
#import "DZFavoriteThreadController.h"
#import "DZContainerController.h"

@interface DZFavoriteListController ()

@property (nonatomic, strong) DZContainerController *rootVC;
@property (nonatomic, strong) NSMutableArray *controllerArr;

@end

@implementation DZFavoriteListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    
    DZFavoriteCateController *forumVC = [[DZFavoriteCateController alloc] init];
    forumVC.title = @"版块";
    
    DZFavoriteThreadController *threadVC = [[DZFavoriteThreadController alloc] init];
    threadVC.title = @"帖子";
    
    [self.controllerArr addObject:threadVC];
    [self.controllerArr addObject:forumVC];
    
    CGRect segmentRect = CGRectMake(0, 0, KScreenWidth, 44);
    self.rootVC = [[DZContainerController alloc] init];
    self.view.height = KScreenHeight - KNavi_ContainStatusBar_Height;
    [self.rootVC configSubControllers:self.controllerArr parentVC:self segmentRect:segmentRect];
}

- (NSMutableArray *)controllerArr {
    if (!_controllerArr) {
        _controllerArr = [NSMutableArray array];
    }
    return _controllerArr;
}

@end
