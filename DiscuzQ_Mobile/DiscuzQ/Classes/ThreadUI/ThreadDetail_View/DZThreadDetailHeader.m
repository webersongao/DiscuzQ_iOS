//
//  DZThreadDetailHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailHeader.h"
#import "DZThreadHead.h"
#import "DZThreadTHelper.h"
#import "DZThreadToolBar.h"

@interface DZThreadDetailHeader ()<threadContentDelegate>

@property (nonatomic, strong) DZThreadHead *userHeader;  //!< 用户信息
@property (nonatomic, strong) DZThreadContent *thredCoreView;  //!< 核心帖子内容
@property (nonatomic, strong) DZThreadToolBar *bottomToolBar;  //!< 转评赞 工具条

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
    [self addSubview:self.bottomToolBar];
    
    [self.userHeader configHeadAction:self avatar:@selector(userAvatarAction) more:@selector(threadMoreAction)];
    
    [self.bottomToolBar configToolBarAction:self like:nil reply:nil share:@selector(threadFavoriteAction)];
}


-(void)userAvatarAction{
    
    [DZThreadTHelper thread_UserCenterCellAction:nil];
}

-(void)threadMoreAction{
    
    [DZThreadTHelper thread_MoreCellAction:nil];
}

-(void)threadFavoriteAction{
    
    [DZThreadTHelper thread_FavoriteCellAction:nil];
}

-(void)updateDetailHead:(DZQDataThread *)dataModel layout:(DZDHeadStyle *)layout{
    
    // 更新布局
    [self layoutDetailHeader:layout];
    
    [self.userHeader updateThreadUserBar:dataModel style:layout];
    
    [self.thredCoreView updateThreadContent:dataModel contentStyle:layout];
    
    [self.bottomToolBar updateDetailToolBar:dataModel toolLayout:layout.frame_toolBar];
}

-(void)layoutDetailHeader:(DZDHeadStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.thredCoreView.frame = layout.kf_content;
    self.bottomToolBar.frame = layout.kf_toolBar;
    
}

#pragma mark threadContentDelegate
// 视频播放
-(void)threadContent:(DZVideoPicView *)playButton playAction:(DZQDataVideo *)dataVideo{
    
    if (self.playVideoBlock) {
        self.playVideoBlock(playButton, dataVideo);
    }
    
    NSString *currentUrl =  dataVideo.attributes.media_url;
    
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

-(DZThreadToolBar *)bottomToolBar{
    if (!_bottomToolBar) {
        _bottomToolBar = [[DZThreadToolBar alloc] initWithFrame:CGRectZero];
    }
    return _bottomToolBar;
}

@end
