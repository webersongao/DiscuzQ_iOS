//
//  DZThreadDetailListView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailListView.h"
#import "DZThreadDetailSection.h"
#import "DZThreadDetailHeader.h"
#import "DZThreadPostCell.h"
#import "DZThreadDetailStyle.h"

@interface DZThreadDetailListView ()<UITableViewDelegate,UITableViewDataSource,DZHtmlItemDelegate>

@property (nonatomic, strong) dispatch_queue_t reloadQueue;  //!< 属性注释
@property (nonatomic, strong) DZQDataThread *dataModel;  //!< 属性注释
@property (nonatomic, strong) NSArray<DZQDataPost *> *dataList;  //!< 属性注释

@property (nonatomic, strong) DZThreadDetailHeader *headerView;  //!< 属性注释

@end

@implementation DZThreadDetailListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self config_ThreadDetailListView];
        self.reloadQueue = dispatch_queue_create("com.reloadDetail", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)config_ThreadDetailListView{
    
    self.delegate = self;
    self.dataSource = self;
    self.tableHeaderView = self.headerView;
    [self registerClass:[DZThreadPostCell class] forCellReuseIdentifier:@"DZThreadPostCell"];
    [self registerClass:[DZThreadDetailSection class] forHeaderFooterViewReuseIdentifier:@"DZThreadDetailSection"];
//    self.tabAnimated = [TABTableAnimated animatedWithCellClass:[DZThreadPostCell class] cellHeight:kCellHeight];
    KWEAKSELF
    self.headerView.playVideoBlock = ^(DZVideoPicView *button, DZQDataVideo *dataVideo) {
        if (weakSelf.detailDelegate && [weakSelf.detailDelegate respondsToSelector:@selector(detaiVideoView:videoDidPlayClick:)]) {
            [weakSelf.detailDelegate detaiVideoView:button videoDidPlayClick:dataVideo];
        }
    };
}

-(DZThreadDetailStyle *)detailStyle{
    if (self.dataModel) {
        return (DZThreadDetailStyle *)self.dataModel.styleModel;
    }
    return nil;
}

-(void)updateThreadHeadDetail:(DZQDataThread *)dataModel{
    
    self.dataModel = dataModel;
    
    self.detailStyle.frame_detail_Head.frame_content.kf_twoItem.htmlDelagate = self;
    
    [self.headerView updateDetailHead:dataModel layout:self.detailStyle.frame_detail_Head];
    
    //    [self beginUpdates];
    self.headerView.frame = self.detailStyle.kf_Header;
    [self setTableHeaderView:self.headerView];
    //    [self endUpdates];
}

-(void)updateThreadPostDetail:(NSArray<DZQDataPost *> *)dataPostList{
    
    // 必须有帖子主题内容之后才可以刷新评论
    if (self.dataModel && self.dataModel.type_id.length) {
        self.dataList = [dataPostList copy];
    }
    
    [self reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.detailStyle.kf_Section.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DZThreadDetailSection *Header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DZThreadDetailSection"];
    
    [Header updateSectionLike:self.dataModel.relationships.firstPost.relationships.likedUsers reward:self.dataModel.relationships.rewardedUsers layout:self.detailStyle.frame_detail_Section];
    
    return Header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZDPostCellStyle *CellStyle = (DZDPostCellStyle *)self.dataList[indexPath.row].styleModel;
    return CellStyle.kf_post_CellHeight;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZThreadPostCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"DZThreadPostCell" forIndexPath:indexPath];
    
    [postCell updateThreadPostCell:self.dataList[indexPath.row]];
    
    return postCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    DZQDataPost *dataPost = self.dataList[indexPath.row];
    
    KSLog(@"WBS 跳转 评论详情? 还是 ？");
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   CGFloat offsetY = scrollView.contentOffset.y;
    if (self.detailDelegate && [self.detailDelegate respondsToSelector:@selector(detailListView:scrollDidScroll:)]) {
        [self.detailDelegate detailListView:self scrollDidScroll:offsetY];
    }
}


#pragma mark DZHtmlItemDelegate

-(void)refreshThreadCurrentHtmlView:(NSString *)htmlString{
    
    dispatch_async(self.reloadQueue, ^{
        self.dataModel.relationships.firstPost.attributes.contentHtml = htmlString;
        [self.detailStyle reloadThreadDetailWithDataModel:self.dataModel];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateThreadHeadDetail:self.dataModel];
        });
    });
    
}



-(DZThreadDetailHeader *)headerView{
    if (!_headerView) {
        _headerView = [[DZThreadDetailHeader alloc] initWithFrame:CGRectZero];
    }
    return _headerView;
}

@end
