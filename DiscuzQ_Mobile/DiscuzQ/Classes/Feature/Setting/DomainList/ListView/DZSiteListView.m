//
//  DZSiteListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteListView.h"

@interface DZSiteListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DZSiteItem *> *dataList;  //!< 属性注释

@end

@implementation DZSiteListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = KWhite_Color;
        [self registerClass:[DZSiteListCell class] forCellReuseIdentifier:@"DZSiteListCell"];
    }
    return self;
}


-(void)updateLocalSiteListView:(NSArray<DZSiteItem *> *)siteArray{
    self.dataList = siteArray.copy;
    [self reloadData];
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZSiteListCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"DZSiteListCell" forIndexPath:indexPath];
    
    [detailCell updateSiteCellWithModel:self.dataList[indexPath.row]];
    
    return detailCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return kCellHeight_60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.selectBlock) {
        self.selectBlock(indexPath);
    }
    
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteSiteDomainData:indexPath];
    }
}

// 删除 站点
- (void)deleteSiteDomainData:(NSIndexPath *)indexPath {
    
    if (self.deleteBlock) {
        self.deleteBlock(indexPath);
    }
}


@end
