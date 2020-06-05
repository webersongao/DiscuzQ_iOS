//
//  DZThreadBaseView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadBaseView.h"
#import "DZThreadBottomBar.h"
#import "DZThreadContent.h"
#import "DZThreadHead.h"
#import "DZThreadListStyle.h"

@interface DZThreadBaseView ()

@property (nonatomic, strong) DZThreadHead *userHeader;  //!< 用户信息
@property (nonatomic, strong) DZThreadContent *contentView;  //!< 核心帖子内容
@property (nonatomic, strong) DZThreadBottomBar *bottomToolBar;  //!< 转评赞 工具条

@property (nonatomic, strong,readonly) DZQDataThread *innerModel;  //!< 数据模型

@end


@implementation DZThreadBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self comfigThreadView];
    }
    return self;
}

-(void)comfigThreadView{
    [self addSubview:self.userHeader];
    [self addSubview:self.contentView];
    [self addSubview:self.bottomToolBar];
}


- (void)updateThreadBaseView:(DZQDataThread *)dataModel{
    
    _innerModel = dataModel;
    DZThreadListStyle *listStyle = (DZThreadListStyle *)dataModel.styleModel;
    
    [self layoutThreadCell:listStyle];
    
    
    [self.contentView updateThreadContent:dataModel contentStyle:listStyle];
    [self.bottomToolBar updateBottombarLayout:listStyle.frame_toolBar];
    [self.userHeader updateThreadUserBar:dataModel style:listStyle];
    
    
}

-(void)layoutThreadCell:(DZThreadListStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.contentView.frame = layout.kf_content;
    self.bottomToolBar.frame = layout.kf_toolBar;
    
}

-(void)configBaseAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel{
    
    [self.userHeader configHeadAction:target avatar:avatarSel more:moreSel];
    
    [self.bottomToolBar configBarAction:target like:likeSel reply:replySel share:shareSel];
    
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
