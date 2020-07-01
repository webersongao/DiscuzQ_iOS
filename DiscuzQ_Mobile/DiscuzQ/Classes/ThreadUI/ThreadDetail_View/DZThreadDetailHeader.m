//
//  DZThreadDetailHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailHeader.h"
#import "DZThreadHead.h"
#import "DZThreadContent.h"
#import "DZThreadToolBar.h"

@interface DZThreadDetailHeader ()

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
}

-(void)updateDetailHead:(DZQDataThread *)dataModel layout:(DZDHeadStyle *)layout{
    
    // 更新布局
    [self layoutDetailHeader:layout];
    
    [self.userHeader updateThreadUserBar:dataModel style:layout];
    
    [self.thredCoreView updateThreadContent:dataModel contentStyle:layout];
    
    [self.bottomToolBar updateDetailToolBar:layout.frame_toolBar];

}

-(void)layoutDetailHeader:(DZDHeadStyle *)layout{
    
    self.userHeader.frame = layout.kf_head;
    self.thredCoreView.frame = layout.kf_content;
    self.bottomToolBar.frame = layout.kf_toolBar;
    
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
