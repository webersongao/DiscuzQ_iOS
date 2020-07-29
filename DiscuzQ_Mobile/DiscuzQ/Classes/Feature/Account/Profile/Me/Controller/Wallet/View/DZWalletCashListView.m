//
//  DZWalletCashListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZWalletCashListView.h"
#import "DZWalletHeader.h"
#import "DZUserHelper.h"
#import "DZWalletCashListCell.h"

@interface DZWalletCashListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DZWalletHeader *cashHeader;  //!< 属性注释
@property (nonatomic, strong) NSArray<DZQDataCashLog *> *dataArray;  //!< 属性注释

@end

@implementation DZWalletCashListView

- (instancetype)initWithListFrame:(CGRect)frame{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_WalletCashListView];
        [self registerClass:[DZWalletCashListCell class] forCellReuseIdentifier:@"DZWalletCashListCell"];
    }
    return self;
}

-(void)config_WalletCashListView{
    self.tableHeaderView = self.cashHeader;
}


-(void)updateWalletCashHeader:(DZQDataWallet *)dataModel{
    [self.cashHeader updateWalletHeader:dataModel];
}

-(void)updateWalletCashListView:(NSArray<DZQDataCashLog *>*)array{
    self.dataArray = array.copy;
    [self reloadData];
}


#pragma mark   /********************* 数据源 *************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataCashLog *cellModel  = self.dataArray[indexPath.row];
    DZWalletCashListCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"DZWalletCashListCell" forIndexPath:indexPath];
    
    [listCell updateWalletCashListCell:cellModel IndexPath:indexPath];
    
    return listCell;
}



#pragma mark   /********************* 代理方法 *************************/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight_60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataCashLog *cashLog = self.dataArray[indexPath.row];
    
    [DZUserHelper user_orderDetailViewInfoAction:cashLog];
}




-(DZWalletHeader *)cashHeader{
    if (!_cashHeader) {
        _cashHeader = [[DZWalletHeader alloc] initWithFrame:CGRectMake(0, 0, self.width, kHeaderHeight_120)];
    }
    return _cashHeader;
}



@end
