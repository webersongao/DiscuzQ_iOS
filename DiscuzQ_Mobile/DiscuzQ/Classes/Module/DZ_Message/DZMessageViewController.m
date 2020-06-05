//
//  DZMessageViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMessageViewController.h"
#import "DZRefreshHeader.h"
#import "DZMessageListView.h"
#import "DZMsgDataTool.h"

@interface DZMessageViewController ()

@property (nonatomic, strong) DZQUnReadModel *UnReadModel;  //!< 属性注释
@property (nonatomic, strong) DZMessageListView *lisView;

@end

@implementation DZMessageViewController


- (instancetype)initWithUnReadModel:(DZQUnReadModel *)UnReadModel
{
    self = [super init];
    if (self) {
        self.UnReadModel = UnReadModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    [self loadNotiData:self.UnReadModel];
    [self config_MessageViewController];
}

- (void)config_MessageViewController {
    [self.view addSubview:self.lisView];
    [self configNaviBar:@"发消息" type:NaviItemText Direction:NaviDirectionRight];
    KWEAKSELF
    self.lisView.cellAction = ^(DZNotiItem *cellItem) {
        [[DZMobileCtrl sharedCtrl] PushToMsgDetailListController:cellItem];
    };
    
    self.lisView.mj_header.refreshingBlock = ^{
        [weakSelf loadLocalUserNotiData];
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:DZ_TabbarRefresh_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLocalUserNotiData) name:DZ_DomainUrlChange_Notify object:nil];
}

-(void)loadLocalUserNotiData{
    
    KWEAKSELF
    [DZMsgDataTool dzx_NotiCountInfoWithCompletion:^(DZQUnReadModel * _Nonnull unReadModel, NSInteger count, BOOL success) {
        if (success) {
            [weakSelf loadNotiData:unReadModel];
        }
    }];
}

-(void)rightBarBtnClick{
    [[DZMobileCtrl sharedCtrl] PushToMsgSendController:nil];
}

- (void)loadNotiData:(DZQUnReadModel *)unModel {
    
    NSArray *notiArray = [DZMsgDataTool messageListData:unModel];
    
    [self.lisView updateMessageList:notiArray];
}

- (void)refresh {
    [self.lisView.mj_header beginRefreshing];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(DZMessageListView *)lisView{
    if (!_lisView) {
        _lisView = [[DZMessageListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _lisView;
}



@end
