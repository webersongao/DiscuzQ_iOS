//
//  DZNotificationController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNotificationController.h"
#import "DZRefreshHeader.h"
#import "DZNotificationListView.h"
#import "DZNotiDataTool.h"

@interface DZNotificationController ()

@property (nonatomic, strong) DZNotificationListView *lisView;

@end

@implementation DZNotificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self config_MessageViewController];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadLocalUserNotiData];
//    [self loadNotiData:[DZMobileCtrl sharedCtrl].User.typeUnreadNotis];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

- (void)config_MessageViewController {
    [self.view addSubview:self.lisView];
    [self configNaviBar:@"发消息" type:NaviItemText Direction:NaviDirectionRight];
    KWEAKSELF
    self.lisView.cellAction = ^(DZNotiItem *cellItem) {
        [[DZMobileCtrl sharedCtrl] PushToMsgDetailListController:cellItem];
    };
    
    self.lisView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadLocalUserNotiData];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:DZ_TabbarRefresh_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLocalUserNotiData) name:DZ_DomainUrlChange_Notify object:nil];
}

-(void)loadLocalUserNotiData{
    
    KWEAKSELF
    [DZNotiDataTool dzx_NotiCountInfoWithCompletion:^(DZQUnReadModel * _Nonnull unReadModel, NSInteger count, BOOL success) {
        if (success) {
            [weakSelf loadNotiData:unReadModel];
        }
        [weakSelf.lisView.mj_header endRefreshing];
    }];
}

-(void)rightBarBtnClick:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToMsgSendController:nil];
}

- (void)loadNotiData:(DZQUnReadModel *)unModel {
    
    NSArray *notiArray = [DZNotiDataTool messageListData:unModel];
    
    [self.lisView updateMessageList:notiArray];
}

- (void)refresh {
    [self.lisView.mj_header beginRefreshing];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(DZNotificationListView *)lisView{
    if (!_lisView) {
        _lisView = [[DZNotificationListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _lisView;
}



@end
