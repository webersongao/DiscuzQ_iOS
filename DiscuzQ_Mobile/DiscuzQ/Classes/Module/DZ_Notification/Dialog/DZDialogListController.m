//
//  DZDialogListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDialogListController.h"
#import "DZDialogListView.h"
#import "DZRefreshHeader.h"

@interface DZDialogListController ()

@property (nonatomic, strong) DZDialogListView *lisView;

@end

@implementation DZDialogListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_MsgController];
}

- (void)config_MsgController {
    [self.view addSubview:self.lisView];
    self.lisView.dialogAction = ^(DZQDataDialog *dataDiaLog) {
        [[DZMobileCtrl sharedCtrl] PushToMsgChatController:dataDiaLog];
    };
}

-(void)loadLocalDialogOrMsgListData{
    KWEAKSELF
    [[DZNetCenter center] dzx_Msg_dialogListWithPage:0 completion:^(NSArray<DZQDataDialog *> * dataDialogArr, BOOL success) {
        [weakSelf updateUserDialogData:dataDialogArr];
        [weakSelf.lisView.mj_header endRefreshing];
    }];
}

-(void)updateUserDialogData:(NSArray<DZQDataDialog *> *)dialogArr{
    
    [self.lisView updateDialogListView:dialogArr];
}


-(DZDialogListView *)lisView{
    if (!_lisView) {
        _lisView = [[DZDialogListView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _lisView;
}



@end
