//
//  DZArticleAttachList.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZArticleAttachList.h"
#import "DZArticleAttachCell.h"
#import "DZThreadHelper.h"


static NSString * const attaIdentifier = @"DZArticleAttachCell";

@interface DZArticleAttachList ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DZLabel *headerLabel;  //!< 属性注释
@property (nonatomic, assign) BOOL hasFile;  //!< <#属性注释#>
@property(nonatomic,strong,readonly) NSArray <DZQDataAttachment *> *dataList;

@end

@implementation DZArticleAttachList

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self config_AttachListView];
    }
    return self;
}


-(void)config_AttachListView{
    self.hasFile = NO;
    self.scrollEnabled = NO;
    self.backgroundColor = KDebug_Color;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    [self registerClass:[DZArticleAttachCell class] forCellReuseIdentifier:attaIdentifier];
}

// 重置 列表数组数据 的唯一方法
-(void)updateFileAttachMentList:(NSArray <DZQDataAttachment *>*)fileArray{
    if (fileArray && [fileArray isKindOfClass:[NSArray class]]) {
        _dataList = fileArray;
    }
    self.hidden = self.dataList.count ? NO : YES;
    self.hasFile = self.dataList.count ? YES  : NO;
    [self reloadFileListThreadData];
}


// 列表刷新
-(void)reloadFileListThreadData{
    [self reloadSection:0 withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark   /********************* 数据源 *************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataAttachment *attachDataModel  = self.dataList[indexPath.row];
    DZArticleAttachCell *listCell = [tableView dequeueReusableCellWithIdentifier:attaIdentifier forIndexPath:indexPath];
    
    [listCell updateAttachFileListCell:attachDataModel];
    return listCell;
}



#pragma mark   /********************* 代理方法 *************************/

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.hasFile ? KCenterBarHeight : 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerLabel;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return kMargin20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZQDataAttachment *attachDataModel  = self.dataList[indexPath.row];
    [DZThreadHelper thread_attachFileCellTapAction:attachDataModel];
    
}





-(DZLabel *)headerLabel{
    if (!_headerLabel) {
        _headerLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"附件：" titleColor:KContent_Color font:KBoldFont(14.f) textAlignment:NSTextAlignmentLeft];
        _headerLabel.contentMode = UIControlContentVerticalAlignmentTop;
    }
    return _headerLabel;
}


@end
