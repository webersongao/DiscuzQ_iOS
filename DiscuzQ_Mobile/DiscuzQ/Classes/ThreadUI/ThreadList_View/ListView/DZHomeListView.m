//
//  DZHomeListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZHomeListView.h"

@interface DZHomeListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DZQDataThread *> *dataArray;  //!< 属性注释

@end

@implementation DZHomeListView

- (instancetype)initWithListFrame:(CGRect)frame{
    self = [super initWithListFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(void)updateHomeListView:(NSArray<DZQDataThread *>*)array{
    self.dataArray = array.copy;
    [self reloadData];
    
    [[DZMediaCenter Center] config_ListPlayer:self dataArray:array];
}


#pragma mark   /********************* 数据源 *************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataThread *cellModel  = self.dataArray[indexPath.row];
    
    DZThreadListStyle *listStyle = (DZThreadListStyle *)cellModel.styleModel;
    DZThreadListCell *listCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(listStyle.className) forIndexPath:indexPath];
    [listCell updateThreadListCell:cellModel IndexPath:indexPath];
    
    return listCell;
}



#pragma mark   /********************* 代理方法 *************************/

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [cell cellWillDisplayWith3DScaleTransform];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZThreadListStyle *cellStyle  = (DZThreadListStyle *)self.dataArray[indexPath.row].styleModel;
    return cellStyle.kf_thread_CellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *threadId  = self.dataArray[indexPath.row].inner_id;
    [[DZMediaCenter Center] config_didSelectTableIndex:indexPath thread:threadId];
}




@end
