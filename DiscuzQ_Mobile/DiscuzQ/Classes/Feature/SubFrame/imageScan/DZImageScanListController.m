//
//  DZImageScanListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZImageScanListController.h"
#import "ForumCollectionController.h"
#import "ForumIndexListController.h"
#import "DZContainerController.h"

static NSString *isFourmList = @"isFourmList";

@interface DZImageScanListController()

@property (nonatomic, strong) NSMutableArray *controllerArr;
@property (nonatomic, strong) ForumIndexListController *indexListVC;
@property (nonatomic, strong) ForumCollectionController *collectVC;
@property (nonatomic, assign) BOOL isList;

@end

@implementation DZImageScanListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configForumView];
    [self configNavigationBar];
}

-(void)configNavigationBar {
    [self configNaviBar:@"navi_forum_collect" type:NaviItemImage Direction:NaviDirectionRight];
}

-(void)configForumView{
    [self addChildViewController:self.collectVC];
    [self addChildViewController:self.indexListVC];
    [self.dz_NavigationBar removeFromSuperview];
    [self.view addSubview:self.collectVC.view];
}

- (void)presentFormOldCtrl:(DZBaseViewController *)oldVC toNewCtrl:(DZBaseViewController *)newVC{
    
    [self transitionFromViewController:oldVC toViewController:newVC duration:0.35 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [oldVC.view removeFromSuperview];
    } completion:^(BOOL finished) {
        [self.view addSubview:newVC.view];
    }];
}

- (ForumIndexListController *)indexListVC {
    if (_indexListVC == nil) {
        _indexListVC = [[ForumIndexListController alloc] init];
    }
    return _indexListVC;
}

- (ForumCollectionController *)collectVC {
    if (_collectVC == nil) {
        _collectVC = [[ForumCollectionController alloc] init];
    }
    return _collectVC;
}

@end
