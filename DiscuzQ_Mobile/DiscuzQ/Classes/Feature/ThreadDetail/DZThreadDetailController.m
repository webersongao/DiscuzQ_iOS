//
//  DZThreadDetailController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailController.h"
#import "DZThreadDetailListView.h"
#import "DZBottomToolBar.h"

@interface DZThreadDetailController ()

@property (nonatomic, copy) NSString *thread_id;
@property (nonatomic, assign) NSInteger postPage;
@property (nonatomic, strong) DZBottomToolBar *bottomBar;  //!< 属性注释
@property (nonatomic, strong) DZThreadDetailListView *detailView;  //!< 属性注释

@end

@implementation DZThreadDetailController

- (instancetype)initWithThread:(NSString *)thread_id
{
    self = [super init];
    if (self) {
        self.postPage = 1;
        self.thread_id = thread_id;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"主题详情";
    self.title = @"超级医生在都市";
    [self config_DetailController];
    [self loadThreadDetailinfomation];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.bottomBar showBottomToolBar:YES];
}


-(void)config_DetailController{
    
    [self.view addSubview:self.detailView];
    [self.view addSubview:self.bottomBar];
    
    KWEAKSELF
    self.detailView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
//        weakSelf.postPage++;
//        [weakSelf loadThreadDetailinfomation];
    }];
    
}

// 获取数据
-(void)loadThreadDetailinfomation{
    
    KWEAKSELF
    [[DZNetCenter center] dzx_threadOneWithThreadId:self.thread_id page:self.postPage completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
        [weakSelf updateDetailView:threadData state:success];
    }];
}

-(void)updateDetailView:(DZQDataThread *)dataModel state:(BOOL)success{
    if (success) {
        [self.detailView updateThreadDetail:dataModel];
    }else{
        [DZMobileCtrl showAlertError:@"数据异常,请稍后重试"];
    }
}


-(DZThreadDetailListView *)detailView{
    if (!_detailView) {
        _detailView = [[DZThreadDetailListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStyleGrouped];
    }
    return _detailView;
}

-(DZBottomToolBar *)bottomBar{
    if (_bottomBar == nil) {
        _bottomBar = [[DZBottomToolBar alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth, KBottom_Height_X) Mode:toolBar_comment];
    }
    return _bottomBar;
}

@end
