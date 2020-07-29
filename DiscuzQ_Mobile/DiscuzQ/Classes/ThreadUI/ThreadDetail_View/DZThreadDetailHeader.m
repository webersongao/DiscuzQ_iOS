//
//  DZThreadDetailHeader.m
//  DiscuzQ
//
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
    
    [self.categoryBar configToolBarAction:self like:@selector(threadCategoryAction:) reply:nil share:nil];
    [self.userHeader configHeadAction:self avatar:@selector(userAvatarAction:) more:@selector(threadMoreAction:) follow:nil];
}



-(void)userAvatarAction:(UIButton *)button{
    
    [DZThreadHelper thread_UserCenterCellAction:self.dataModel.relationships.user.attributes.user_id];
}

-(void)threadCategoryAction:(UIButton *)button{
    
    [DZThreadHelper thread_CategoryCenterCellAction:self.dataModel.relationships.category];
}

-(void)threadMoreAction:(UIButton *)button{
    
    [DZThreadHelper thread_MoreCellAction:nil sender:button];
}


-(void)updateDetailHead:(DZQDataThread *)dataModel layout:(DZDHeadStyle *)layout{
    
    // 更新布局
    self.dataModel = dataModel;
    [self layoutDetailHeader:layout];
    
    [self.userHeader updateThreadUserBar:[DZUIUserModel convertThreadModel:dataModel] style:layout.frame_user];
    
    [self.thredCoreView updateThreadContent:dataModel contentStyle:layout];
    
    [self.categoryBar updateDetailCategoryBar:dataModel.relationships.category toolLayout:layout.frame_toolBar];
    
}

-(void)layoutDetailHeader:(DZDHeadStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.thredCoreView.frame = layout.kf_content;
    self.categoryBar.frame = layout.kf_toolBar;
    
}

#pragma mark threadContentDelegate
// 视频播放
-(void)threadContent:(DZVideoPicView *)playButton playAction:(DZQDataVideo *)dataVideo{
    
    if (self.playVideoBlock) {
        self.playVideoBlock(playButton, dataVideo);
    }
    
//    NSString *currentUrl =  dataVideo.attributes.media_url;
    
    //    [[DZMediaCenter Center] Media_videoPlayWithAssetURL:currentUrl playView:playButton];
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
