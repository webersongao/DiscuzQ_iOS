//
//  DZSettingListView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSettingListView.h"
#import "DZSettingFooter.h"
#import "DZSettingHelper.h"
#import "DZCacheHelper.h"
#import "DZSettingListCell.h"
#import "DZSettingSectionHeader.h"

@interface DZSettingListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;  //!< 属性注释
@property (nonatomic, strong) DZSettingFooter *footerView;  //!< <#属性注释#>

@end

@implementation DZSettingListView

- (instancetype)initSettingFrame:(CGRect)frame{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        [self config_SettingListView];
        self.tableFooterView = self.footerView;
    }
    return self;
}


-(void)config_SettingListView{
    
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = KDebug_Color;
    [self registerClass:[DZSettingListCell class] forCellReuseIdentifier:@"DZSettingListCell"];
}

-(void)updateSettingList:(NSArray *)dataArray{
    self.dataArray = dataArray;
    [self reloadData];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.dataArray[section];
    return arr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kToolBarHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    DZSettingSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DZSettingSectionHeader"];
    if(!header){
        header = [[DZSettingSectionHeader alloc] initWithReuseIdentifier:@"DZSettingSectionHeader"];
    }
    NSString *sectionTitle = nil;
    if (section == 0) {
        sectionTitle = @"账号";
    }else if (section == 1){
        sectionTitle = @"应用";
    }else if (section == 2){
        sectionTitle = @"其他";
    }
    [header updateLabelTitle:sectionTitle];
    return header;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DZSettingListCell * listCell = [tableView dequeueReusableCellWithIdentifier:@"DZSettingListCell" forIndexPath:indexPath];
    
    NSString *title = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    NSString *desc = @"";
    if (indexPath.section == 0 && indexPath.row == 2) {
        desc = [NSString stringWithFormat:@"%.2fM",[[DZCacheHelper Shared] filePathSize]];
    }
    [listCell updateCell:title detail:desc indexPath:indexPath];
    
    return listCell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight_50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[DZSettingHelper shared] didTappedTableView:tableView IndexPath:indexPath];
}



-(DZSettingFooter *)footerView{
    if (!_footerView) {
        _footerView = [[DZSettingFooter alloc] initWithFrame:CGRectMake(0, 100, self.width, 200)];
    }
    return _footerView;
}



@end
