//
//  DZThreadCellView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadCellView.h"
#import "DZThreadListModel.h"

#import "DZThreadTitle.h"
#import "DZThreadAttach.h"
#import "DZThreadContent.h"

@interface DZThreadCellView ()

@property (nonatomic, strong) DZThreadTitle *titleView;  //!< 属性注释
@property (nonatomic, strong) DZThreadAttach *attchView;  //!< 属性注释
@property (nonatomic, strong) DZThreadContent *subContentView;  //!< 属性注释

@property (nonatomic, strong,readonly) DZThreadListModel *threadModel;  //!< 属性注释

@end


@implementation DZThreadCellView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self comfigThreadView];
    }
    return self;
}

-(void)comfigThreadView{
    [self addSubview:self.headerView];
    [self addSubview:self.titleView];
    [self addSubview:self.attchView];
    [self addSubview:self.subContentView];
    [self addSubview:self.bottomBarView];
}


- (void)updateThreadCellView:(DZThreadListModel *)Model{
    
    _threadModel = Model;
    
    [self layoutThreadCell:Model.listLayout];
    
    [self.headerView updateThreadHeadWithModel:Model];
    
    [self.titleView updateThreadTitle:Model.mainTitleString isTop:Model.listLayout.isTop];
    [self.subContentView updateThreadContent:Model.lastReplyString];
    [self.attchView updateUrlList:Model.imglist size:Model.listLayout.attachFrame.size];
    
    [self.bottomBarView updateThreadBottomBar:Model];
    
}

-(void)layoutThreadCell:(DZThreadLayout *)layout{
    
    self.headerView.frame = layout.headFrame;
    self.titleView.frame = layout.titleFrame;
    self.subContentView.frame = layout.contentFrame;
    self.attchView.frame = layout.attachFrame;
    self.bottomBarView.frame = layout.bottomFrame;
    
}



#pragma mark   /********************* 初始化 *************************/

-(DZThreadHead *)headerView{
    if (!_headerView) {
        _headerView = [[DZThreadHead alloc] initWithFrame:CGRectZero];
    }
    return _headerView;
}

-(DZThreadTitle *)titleView{
    if (!_titleView) {
        _titleView = [[DZThreadTitle alloc] initWithFrame:CGRectZero];
    }
    return _titleView;
}

-(DZThreadContent *)subContentView{
    if (!_subContentView) {
        _subContentView = [[DZThreadContent alloc] initWithFrame:CGRectZero];
    }
    return _subContentView;
}

-(DZThreadAttach *)attchView{
    if (!_attchView) {
        _attchView = [[DZThreadAttach alloc] initWithFrame:CGRectZero];
    }
    return _attchView;
}

-(DZThreadBottomBar *)bottomBarView{
    if (!_bottomBarView) {
        _bottomBarView = [[DZThreadBottomBar alloc] initWithFrame:CGRectZero];
    }
    return _bottomBarView;
}



@end
