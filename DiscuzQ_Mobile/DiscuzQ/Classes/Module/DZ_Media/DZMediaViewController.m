//
//  DZMediaViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMediaViewController.h"
#import "DZImageScanListController.h"
#import "DZVideoScanListController.h"

@interface DZMediaViewController ()
{
    BOOL m_isMedia;// 是否是图片社区
}
@property (nonatomic, strong) DZImageScanListController *imageListVC;
@property (nonatomic, strong) DZVideoScanListController *videoScanVC;  //!< 属性注释

@end

@implementation DZMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configDZMediaViewControllerView];
    [self loadHomeForumDataFromServer];
    [self configHomeScroolViewAction];
}
-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}
-(void)configDZMediaViewControllerView{
    
    self.imageListVC = [[DZImageScanListController alloc] init];
    self.videoScanVC = [[DZVideoScanListController alloc] init];
    
    self.title = m_isMedia ? @"看图片" : @"短视频";
    [self addChildViewController:self.imageListVC];
    [self addChildViewController:self.videoScanVC];
    [self.view addSubview:self.videoScanVC.view];
    
    [self dz_bringNavigationBarToFront];
    [self configNaviBar:@"切换" type:NaviItemText Direction:NaviDirectionLeft];
    [self configNaviBar:@"navi_Post_thread" type:NaviItemImage Direction:NaviDirectionRight];
}

-(void)configHomeScroolViewAction{
    
}

-(void)loadHomeForumDataFromServer{
    KWEAKSELF
    [[DZNetCenter center] dzx_categoryListWithCompletion:^(NSArray<DZQDataCate *> *varModel, BOOL success) {
        if (success) {
            [weakSelf configForumCateData:varModel];
        }else{
            [DZMobileCtrl showAlertError:@"数据获取错误"];
        }
    }];
    
}


-(void)configForumCateData:(NSArray <DZQDataCate *>*)listArray{
    [self.videoScanVC.homeMainView.cateHeader reloadDataSource:listArray];
}

 /********************* 响应事件 *************************/

- (void)rightBarBtnClick:(UIButton *)button {
    [[DZMobileCtrl sharedCtrl] PushToPostTabViewController];
}

-(void)leftBarBtnClick:(UIButton *)button{
    KWEAKSELF
    if (m_isMedia) {
        [weakSelf transitionFromViewController:self.imageListVC toViewController:self.videoScanVC duration:0.35 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [weakSelf.imageListVC.view removeFromSuperview];
            [weakSelf.view addSubview:weakSelf.videoScanVC.view];
        } completion:nil];
    }else{
        [weakSelf transitionFromViewController:self.videoScanVC toViewController:self.imageListVC duration:0.35 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [weakSelf.videoScanVC.view removeFromSuperview];
            [weakSelf.view addSubview:weakSelf.imageListVC.view];
        } completion:nil];
    }
    m_isMedia = !m_isMedia;
    [self dz_bringNavigationBarToFront];
    self.title = m_isMedia ? @"看图片" : @"短视频";
}

 /********************* 初始化 *************************/



@end
