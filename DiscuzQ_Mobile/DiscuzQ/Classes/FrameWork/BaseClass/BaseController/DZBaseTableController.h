//
//  DZBaseTableController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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

@end
