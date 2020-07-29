//
//  DZBaseTableController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseTableController.h"

@implementation DZBaseTableController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    
    // 点击菜单栏刷新
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:DZ_TabbarRefresh_Notify object:nil];
    // 点击导航栏到顶部
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarTappedAction:) name:DZ_StatusBarTap_Notify object:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaul5CellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaul5CellId"];
    }
    return cell;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - private
// 刷新
- (void)refresh {
    if ([self.view dz_intersectsWithAnotherView:nil]) {
        [self.tableView.mj_header beginRefreshing];
    }
}

// 点击状态栏到顶部
- (void)statusBarTappedAction:(NSNotification*)notification {
    if ([self.view dz_intersectsWithAnotherView:nil]) {
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark setter getter
- (NSMutableDictionary *)cellHeightDict {
    if (!_cellHeightDict) {
        _cellHeightDict = [NSMutableDictionary dictionary];
    }
    return _cellHeightDict;
}

- (NSMutableArray *)dataSourceArr {
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

- (DZBaseTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[DZBaseTableView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _tableView;
}

@end
