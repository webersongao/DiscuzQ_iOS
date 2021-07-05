//
//  DZNotificationController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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
    [self config_MessageViewController];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

- (void)config_MessageViewController {
    [self.view addSubview:self.lisView];
    
    KWEAKSELF
    self.lisView.cellAction = ^(DZNotiItem *cellItem) {
        [[DZMobileCtrl sharedCtrl] PushToMsgDetailListController:cellItem];
    };
    
    self.lisView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadLocalDialogOrMsgListData];
    }];
}

-(void)loadLocalDialogOrMsgListData{
    
    KWEAKSELF
    [self loadNotiCateData:nil];
    [DZNotiDataTool dzx_NotiCountInfoWithCompletion:^(DZQUnReadV1 * _Nonnull unReadModel, NSInteger count, BOOL success) {
        [weakSelf loadNotiCateData:unReadModel];
        [weakSelf.lisView.mj_header endRefreshing];
    }];
}

- (void)loadNotiCateData:(DZQUnReadV1 *)unModel {
    
    NSArray *notiArray = [DZNotiDataTool messageListData:unModel];
    
    [self.lisView updateNotiCateList:notiArray];
}


-(DZNotificationListView *)lisView{
    if (!_lisView) {
        _lisView = [[DZNotificationListView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _lisView;
}



@end
