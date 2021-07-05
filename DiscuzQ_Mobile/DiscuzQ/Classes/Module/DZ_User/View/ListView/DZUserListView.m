//
//  DZUserListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserListView.h"
#import "DZUserListCell.h"

@interface DZUserListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray <DZUserItemModel *>* dataList;  //!< 属性注释

@end

@implementation DZUserListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.tableHeaderView = self.headView;
        [self registerClass:[DZUserListCell class] forCellReuseIdentifier:@"DZUserListCell"];
    }
    return self;
}

-(void)updateLocalList:(NSArray <DZUserItemModel *>*)dataArray{
    
    if (!dataArray.count) { return; }
    
    self.dataList = dataArray;
    [self reloadData];
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZUserListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DZUserListCell"];
    
    [cell updateUserListCenterCell:self.dataList[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight_50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.touchAction) {
        self.touchAction(self.dataList[indexPath.row].action);
    }
}


-(DZUserHeader *)headView{
    if (!_headView) {
        _headView = [[DZUserHeader alloc] initWithFrame:CGRectMake(0, 0, self.width, 145.f)];
    }
    return _headView;
}





@end
