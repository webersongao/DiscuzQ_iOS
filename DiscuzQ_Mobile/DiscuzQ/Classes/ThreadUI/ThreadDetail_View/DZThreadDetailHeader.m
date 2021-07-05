//
//  DZThreadDetailHeader.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailHeader.h"
#import "DZThreadHead.h"
#import "DZThreadToolBar.h"
#import "DZThreadHelper.h"
#import "DZThreadCateBar.h"

@interface DZThreadDetailHeader ()<threadContentDelegate>

@property (nonatomic, strong) DZQDataThread *dataModel;  //!< 数据
@property (nonatomic, strong) DZThreadHead *userHeader;  //!< 用户信息
@property (nonatomic, strong) DZThreadContent *thredCoreView;  //!< 核心帖子内容
@property (nonatomic, strong) DZThreadCateBar *categoryBar;  //!< 左侧分类

@end

@implementation DZThreadDetailHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_DetailHeader];
    }
    return self;
}


-(void)config_DetailHeader{
    
    [self addSubview:self.userHeader];
    [self addSubview:self.thredCoreView];
    [self addSubview:self.categoryBar];
    
    [self.categoryBar configToolBarAction:self left:@selector(threadCategoryAction:) center:nil right:@selector(threadLocationAction:)];
    [self.userHeader configHeadAction:self avatar:@selector(userAvatarAction:) more:@selector(threadMoreAction:) follow:nil];
}



-(void)userAvatarAction:(UIButton *)button{
    
    [DZThreadHelper thread_UserCenterCellAction:self.dataModel.relationships.user.attributes.user_id];
}

-(void)threadLocationAction:(UIButton *)button{
    NSLog(@"WBS 跳转至 定位");
}

-(void)threadCategoryAction:(UIButton *)button{
    
    [DZThreadHelper thread_CategoryCenterCellAction:nil];
}

-(void)threadMoreAction:(UIButton *)button{
    
    [DZThreadHelper thread_MoreCellAction:self.dataModel sender:button];
}


-(void)updateDetailHead:(DZQDataThread *)dataModel layout:(DZDHeadStyle *)layout{
    
    // 更新布局
    self.dataModel = dataModel;
    [self layoutDetailHeader:layout];
    
    [self.userHeader updateThreadUserBar:[DZUIUserModel convertThreadModel:dataModel] style:layout.frame_user];
    
    [self.thredCoreView updateThreadContent:dataModel contentStyle:layout];
    
    [self.categoryBar updateDetailBarCate:dataModel.relationships.category.attributes.name location:dataModel.attributes.location Layout:layout.frame_toolBar];
    
}

-(void)layoutDetailHeader:(DZDHeadStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.thredCoreView.frame = layout.kf_content;
    self.categoryBar.frame = layout.kf_toolBar;
    
}

#pragma mark threadContentDelegate
// 视频播放
-(void)threadContent:(DZMediaPlayView *)playButton playAction:(DZQDataVideo *)dataVideo{
    
    if (self.playVideoBlock) {
        self.playVideoBlock(playButton, dataVideo);
    }
}


#pragma mark   /********************* 初始化 *************************/

-(DZThreadHead *)userHeader{
    if (!_userHeader) {
        _userHeader = [[DZThreadHead alloc] initWithFrame:CGRectZero];
    }
    return _userHeader;
}

-(DZThreadContent *)thredCoreView{
    if (!_thredCoreView) {
        _thredCoreView = [[DZThreadContent alloc] initWithFrame:CGRectZero];
        _thredCoreView.actionDelegate = self;
    }
    return _thredCoreView;
}


-(DZThreadCateBar *)categoryBar{
    if (!_categoryBar) {
        _categoryBar = [[DZThreadCateBar alloc] initWithFrame:CGRectZero];
    }
    return _categoryBar;
}

@end
