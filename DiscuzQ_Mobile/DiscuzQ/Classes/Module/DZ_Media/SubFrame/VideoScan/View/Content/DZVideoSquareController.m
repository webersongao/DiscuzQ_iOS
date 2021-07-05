//
//  DZVideoSquareController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/10.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZVideoSquareController.h"
#import "DZVideoSquareView.h"
#import "DZRefreshHeader.h"
#import "DZRefreshFooter.h"

@interface DZVideoSquareController ()

@property (nonatomic, assign) NSInteger page;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray *dataSourceArr;  //!< 属性注释
@property (nonatomic, strong) DZVideoSquareView *squareView;  //!< 属性注释
@end

@implementation DZVideoSquareController

#pragma mark - lifeCyle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config_mainSquareView];
    [self.dz_NavigationBar removeFromSuperview];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstRequest:) name:DZ_ContainerRequest_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshHomeListData) name:DZ_DomainUrlChange_Notify object:nil];
    
    [self requestLocalCache];
}

- (void)config_mainSquareView {
    
    [self.view addSubview:self.squareView];
    self.squareView.frame = KView_OutTab_Bounds;
    
    KWEAKSELF;
    self.squareView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf refreshHomeListData];
        if ([weakSelf.view dz_intersectsWithAnotherView:nil]) {
        }
    }];
    
    self.squareView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadThreadListData:self.page];
    }];
    
}

#pragma mark - Request

- (void)firstRequest:(NSNotification *)notification {
    if (![self.view dz_intersectsWithAnotherView:nil]) {
        return;
    }
    
    NSDictionary *userInfo = notification.userInfo;
    if ([DataCheck isValidDict:userInfo]) {
        NSInteger index = [[userInfo objectForKey:@"selectIndex"] integerValue];
        if (!self.dataSourceArr.count && index != 0) {
            [self requestLocalCache];
        }
    }
}

- (void)requestLocalCache {
    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
    [self downLoadThreadListData:self.page];
}

- (void)refreshHomeListData {
    self.page = 1;
    [self.squareView.mj_footer resetNoMoreData];
    [self downLoadThreadListData:self.page];
}

#pragma mark - 数据下载
- (void)downLoadThreadListData:(NSInteger)page {
    // 请求数据
    [self.HUD hide];
}





@end
