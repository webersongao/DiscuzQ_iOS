//
//  DZBaseTableController.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZBaseTableView.h"

@interface DZBaseTableController : DZBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) DZBaseTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, strong) NSMutableDictionary *cellHeightDict;

@property (nonatomic, assign) NSInteger page;

/**
 空数据的时候显示 这里要设置dataSourceArr.count = 0的时候
 */
- (void)emptyShow;

@end
