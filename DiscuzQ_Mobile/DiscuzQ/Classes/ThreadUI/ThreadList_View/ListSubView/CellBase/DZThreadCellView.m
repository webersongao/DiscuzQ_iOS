//
//  DZThreadCellView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadCellView.h"
#import "DZThreadBottomBar.h"
#import "DZThreadContent.h"
#import "DZThreadHead.h"
#import "DZThreadListStyle.h"

@interface DZThreadCellView ()<threadContentDelegate>


@property (nonatomic, strong) NSIndexPath *indexPath;  //!< cellPath
@property (nonatomic, strong) DZThreadHead *userHeader;  //!< 用户信息
@property (nonatomic, strong) DZThreadContent *contentView;  //!< 核心帖子内容
@property (nonatomic, strong) DZThreadBottomBar *bottomToolBar;  //!< 转评赞 工具条

@property (nonatomic, strong,readonly) DZQDataThread *innerModel;  //!< 数据模型

@end


@implementation DZThreadCellView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self comfigThreadView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}

-(void)comfigThreadView{
    [self addSubview:self.userHeader];
    [self addSubview:self.contentView];
    [self addSubview:self.bottomToolBar];
}


- (void)updateThreadBaseView:(DZQDataThread *)dataModel cellPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;
    _innerModel = dataModel;
    DZThreadListStyle *listStyle = (DZThreadListStyle *)dataModel.styleModel;
    
    [self layoutThreadCell:listStyle];
    
    
    [self.contentView updateThreadContent:dataModel contentStyle:listStyle];
    [self.userHeader updateThreadUserBar:dataModel style:listStyle];
    [self.bottomToolBar updateBottombar:dataModel.relationships.firstPost.attributes Layout:listStyle.frame_toolBar];
    
}

-(void)layoutThreadCell:(DZThreadListStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.contentView.frame = layout.kf_content;
    self.bottomToolBar.frame = layout.kf_toolBar;
    
}

-(void)configBaseAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel{
    
    [self.userHeader configHeadAction:target avatar:avatarSel more:moreSel];
    
    [self.bottomToolBar configToolBarAction:target like:likeSel reply:replySel share:shareSel];
    
}

#pragma mark threadContentDelegate
// 视频播放
-(void)threadContent:(DZVideoPicView *)playButton playAction:(DZQDataVideo *)dataVideo{
    
    [[DZMediaCenter Center] Media_videoPlayWithIndexPath:self.indexPath playView:playButton];
    
}

#pragma mark   /********************* 初始化 *************************/

-(DZThreadHead *)userHeader{
    if (!_userHeader) {
        _userHeader = [[DZThreadHead alloc] initWithFrame:CGRectZero];
    }
    return _userHeader;
}

-(DZThreadContent *)contentView{
    if (!_contentView) {
        _contentView = [[DZThreadContent alloc] initWithFrame:CGRectZero];
        _contentView.actionDelegate = self;
    }
    return _contentView;
}

-(DZThreadBottomBar *)bottomToolBar{
    if (!_bottomToolBar) {
        _bottomToolBar = [[DZThreadBottomBar alloc] initWithFrame:CGRectZero];
    }
    return _bottomToolBar;
}



@end
