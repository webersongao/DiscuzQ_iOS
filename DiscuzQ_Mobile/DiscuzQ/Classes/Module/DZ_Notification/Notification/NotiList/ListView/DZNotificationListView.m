//
//  DZNotificationListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNotificationListView.h"
#import "DZNotificationListCell.h"
#import "DZNotiDataTool.h"

@interface DZNotificationListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray<DZNotiItem *> *dataList;
@end

@implementation DZNotificationListView

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
    [self registerClass:[DZNotificationListCell class] forCellReuseIdentifier:@"DZNotificationListCell"];
}


-(void)updateNotiCateList:(NSArray<DZNotiItem *> *)notiArray{
    self.dataList = notiArray.copy;
    [self reloadData];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZNotificationListCell *msgCell = [tableView dequeueReusableCellWithIdentifier:@"DZNotificationListCell" forIndexPath:indexPath];
    
    [msgCell updateMessageListCell:self.dataList[indexPath.row]];
    
    return msgCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight_60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellAction) {
        self.cellAction(self.dataList[indexPath.row]);
    }
}


@end
