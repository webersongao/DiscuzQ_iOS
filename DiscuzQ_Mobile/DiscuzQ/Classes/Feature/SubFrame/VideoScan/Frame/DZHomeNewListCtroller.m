//
//  DZHomeNewListCtroller.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/10.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZHomeNewListCtroller.h"
#import "DZThreadListCell+Manager.h"
#import "DZThreadListModel+Display.h"

@interface DZHomeNewListCtroller ()

@end

@implementation DZHomeNewListCtroller

#pragma mark - lifeCyle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self.dz_NavigationBar removeFromSuperview];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstRequest:) name:DZ_ContainerRequest_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshHomeListData) name:DZ_DomainUrlChange_Notify object:nil];
    
    [self requestLocalCache];
}

- (void)initTableView {
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = KView_OutTab_Bounds;
    [self.tableView registerClass:[DZThreadListCell class] forCellReuseIdentifier:@"DZThreadListCell"];
    KWEAKSELF;
    self.tableView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf refreshHomeListData];
        if ([weakSelf.view dz_intersectsWithAnotherView:nil]) {
        }
    }];
    
    self.tableView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadThreadListData:self.page];
    }];
//    ((MJRefreshAutoFooter *)self.tableView.mj_footer).triggerAutomaticallyRefreshPercent = -10;
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
    [self.tableView.mj_footer resetNoMoreData];
    [self downLoadThreadListData:self.page];
}

#pragma mark - 数据下载
- (void)downLoadThreadListData:(NSInteger)page {
    // 请求数据
}

- (void)clearDatasource {
    if (self.cellHeightDict.count > 0) {
        [self.cellHeightDict removeAllObjects];
    }
    if (self.dataSourceArr.count > 0) {
        [self.dataSourceArr removeAllObjects];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.row];
    DZThreadListCell * listCell = [self.tableView dequeueReusableCellWithIdentifier:@"DZThreadListCell" forIndexPath:indexPath];
    
    [listCell updateThreadListCell:[listModel dealSpecialThread]];
    
    return listCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.cellHeightDict[indexPath]) {
        self.cellHeightDict[indexPath] = @([self heightForRowAtIndexPath:indexPath tableView:tableView]);
    }
    return [self.cellHeightDict[indexPath] floatValue];
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.row];
    return listModel.listLayout.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.row];
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:listModel.tid];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.didScrollAction) {
        self.didScrollAction(scrollView);
    }
}

#pragma mark - Action
- (void)toOtherCenter:(UITapGestureRecognizer *)sender {
    
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:checkInteger(sender.view.tag)];
}

@end
