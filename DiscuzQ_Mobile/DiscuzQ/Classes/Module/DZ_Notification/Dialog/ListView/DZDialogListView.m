//
//  DZDialogListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDialogListView.h"
#import "DZDialogListCell.h"
#import "DZNotiDataTool.h"
#import "DZDiaLogStyle.h"

@interface DZDialogListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DZQDataDialog *> *dataList;

@end

@implementation DZDialogListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
       [self config_MessageCollectView];
    }
    return self;
}

-(void)config_MessageCollectView{
    
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = KWhite_Color;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self registerClass:[DZDialogListCell class] forCellReuseIdentifier:@"DZDialogListCell"];
}


-(void)updateDialogListView:(NSArray<DZQDataDialog *> *)notiArray{
    self.dataList = notiArray.copy;
    [self reloadData];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZDialogListCell *msgCell = [tableView dequeueReusableCellWithIdentifier:@"DZDialogListCell" forIndexPath:indexPath];
    
    [msgCell updateMessageListCell:self.dataList[indexPath.row]];
    
    return msgCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZDiaLogStyle *cellStyle = (DZDiaLogStyle *)self.dataList[indexPath.row].styleModel;
    return cellStyle.kf_cellHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dialogAction) {
        self.dialogAction(self.dataList[indexPath.row]);
    }
}


@end
