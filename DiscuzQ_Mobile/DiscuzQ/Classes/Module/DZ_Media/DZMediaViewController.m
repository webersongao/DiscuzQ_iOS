//
//  DZMediaViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMediaViewController.h"
#import "DZThreadScanController.h"
#import "DZVideoScanListController.h"

@interface DZMediaViewController ()
{
    BOOL m_isVideo;// 是否看视频
}
@property (nonatomic, strong) DZThreadScanController *threadScanVC;
@property (nonatomic, strong) DZVideoScanListController *videoScanVC;  //!< 属性注释

@end

@implementation DZMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    m_isVideo = NO;
    [self configDZMediaViewControllerView];
    [self loadHomeForumDataFromServer];
    [self configHomeScrolViewAction];
}
-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}
-(void)configDZMediaViewControllerView{
    
    self.threadScanVC = [[DZThreadScanController alloc] init];
    self.videoScanVC = [[DZVideoScanListController alloc] init];
    
    self.title = m_isVideo ? @"短视频" : @"看类型" ;
    [self addChildViewController:self.videoScanVC];
    [self addChildViewController:self.threadScanVC];
    [self.view addSubview:self.threadScanVC.view];
    
    [self dz_bringNavigationBarToFront];
    [self configNaviBar:@"切换" type:NaviItemText Direction:NaviDirectionLeft];
}

-(void)configHomeScrolViewAction{
    
}

-(void)loadHomeForumDataFromServer{
    KWEAKSELF
    [[DZNetCenter center] dzx_categoryListWithCompletion:^(NSArray<DZThreadCateM *> *varModel, BOOL success) {
        if (success) {
            [weakSelf configForumCateData:varModel];
        }else{
            [DZMobileCtrl showAlertError:@"数据获取错误"];
        }
    }];
}


-(void)configForumCateData:(NSArray <DZThreadCateM *>*)listArray{
    [self.videoScanVC.homeMainView.cateHeader reloadDataSource:listArray];
}

 /********************* 响应事件 *************************/

-(void)leftBarBtnClick:(UIButton *)button{
    KWEAKSELF
    if (m_isVideo) {
        [weakSelf transitionFromViewController:self.videoScanVC toViewController:self.threadScanVC duration:0.35 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [weakSelf.videoScanVC.view removeFromSuperview];
            [weakSelf.view addSubview:weakSelf.threadScanVC.view];
        } completion:nil];
    }else{
        [weakSelf transitionFromViewController:self.threadScanVC toViewController:self.videoScanVC duration:0.35 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [weakSelf.threadScanVC.view removeFromSuperview];
            [weakSelf.view addSubview:weakSelf.videoScanVC.view];
        } completion:nil];
    }
    m_isVideo = !m_isVideo;
    [self dz_bringNavigationBarToFront];
    self.title = m_isVideo ? @"短视频" : @"看类型";
}

 /********************* 初始化 *************************/



@end
