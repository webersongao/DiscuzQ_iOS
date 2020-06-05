//
//  DZMsgDetailListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMsgDetailListView.h"
#import "DZMsgDetailCell.h"

@interface DZMsgDetailListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DZQDataNoti *> *dataList;  //!< 属性注释

@end

@implementation DZMsgDetailListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[DZMsgDetailCell class] forCellReuseIdentifier:@"DZMsgDetailCell"];
    }
    return self;
}


-(void)updateDetailListView:(NSArray<DZQDataNoti *> *)notiArray{
    self.dataList = notiArray.copy;
    [self reloadData];
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZMsgDetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"DZMsgDetailCell" forIndexPath:indexPath];
    
    [detailCell updateMsgDetailCell:self.dataList[indexPath.row]];
    
    return detailCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    DZNotiListStyle *style = (DZNotiListStyle *)self.dataList[indexPath.row].styleModel;
    
    return style.kf_ContentHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZQNotiModel *model = self.dataList[indexPath.row].attributes;
    
    [[DZMobileCtrl sharedCtrl] PushToMsgChatController:model.noti_id name:model.user_name];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteMyNotiMessage:indexPath];
    }
}

// 删除通知
- (void)deleteMyNotiMessage:(NSIndexPath *)indexPath {
    
    
    
}



@end




