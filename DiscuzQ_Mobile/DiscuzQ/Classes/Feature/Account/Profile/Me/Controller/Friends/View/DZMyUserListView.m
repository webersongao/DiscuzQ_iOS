//
//  DZMyUserListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyUserListView.h"
#import "DZMyUserListCell.h"
#import "DZFollowCellStyle.h"

@interface DZMyUserListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) BOOL isFrom;  //!< <#属性注释#>
@property (nonatomic, strong) NSArray<DZQDataFollow *> *dataArray;  //!< 属性注释

@end

@implementation DZMyUserListView

- (instancetype)initWithListFrame:(CGRect)frame{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[DZMyUserListCell class] forCellReuseIdentifier:@"DZMyUserListCell"];
    }
    return self;
}

-(void)updateMyUserListView:(NSArray<DZQDataFollow *>*)array isFrom:(BOOL)isFrom{
    self.dataArray = array.copy;
    self.isFrom = isFrom;
    [self reloadData];
}


#pragma mark   /********************* 数据源 *************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataFollow *cellModel  = self.dataArray[indexPath.row];
    DZMyUserListCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"DZMyUserListCell" forIndexPath:indexPath];
    
    [listCell updateMyUserCell:cellModel isFromUser:self.isFrom];
    return listCell;
}



#pragma mark   /********************* 代理方法 *************************/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZFollowCellStyle *cellStyle  = (DZFollowCellStyle *)self.dataArray[indexPath.row].styleModel;
    return cellStyle.kf_Follow_CellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *threadId  = self.dataArray[indexPath.row].inner_id;
//    [[DZMediaCenter Center] config_didSelectTableIndex:indexPath thread:threadId];
}







@end
