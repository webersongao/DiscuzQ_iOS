//
//  DZDiscoverListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZDiscoverListView.h"

@interface DZDiscoverListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DZQDataThread *> *dataArray;  //!< 属性注释

@end

@implementation DZDiscoverListView

- (instancetype)initWithListFrame:(CGRect)frame{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[DZThreadListCell class] forCellReuseIdentifier:@"DZThreadListCell"];
    }
    return self;
}

-(void)updateDiscoverListView:(NSArray<DZQDataThread *>*)array{
    self.dataArray = array.copy;
    [self reloadData];
}


#pragma mark   /********************* 数据源 *************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataThread *cellModel  = self.dataArray[indexPath.row];
    DZThreadListCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"DZThreadListCell" forIndexPath:indexPath];
    
    [listCell updateThreadListCell:cellModel];
    return listCell;
}



#pragma mark   /********************* 代理方法 *************************/

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZThreadListStyle *cellStyle  = (DZThreadListStyle *)self.dataArray[indexPath.row].styleModel;
    return cellStyle.kf_thread_CellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *threadId  = self.dataArray[indexPath.row].type_id;
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:threadId];
}




@end
