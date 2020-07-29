//
//  DZThreadDetailSection.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailSection.h"
#import "DZThreadToolBar.h"
#import "DZAUserListBar.h"
#import "DZThreadHelper.h"
#import "DZThreadCashPayView.h"

@interface DZThreadDetailSection ()

@property (nonatomic, strong) DZThreadCashPayView *rewardPayView;  //!< 付费、打赏用户列表
@property (nonatomic, strong) DZThreadToolBar *threadToolBar;  //!< 转评赞 工具条

@property (nonatomic, strong) UIView *grayLine;  //!< 顶部10px分割线
@property (nonatomic, strong) UIView *bottoLine;  //!< 底部分割线
@property (nonatomic, strong) DZAUserListBar *likeUserBar;  //!< 点赞用户列表

@end

@implementation DZThreadDetailSection

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_DetailSection];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_DetailSection{

    [self.contentView addSubview:self.rewardPayView];
    [self.contentView addSubview:self.threadToolBar];
    
    [self.contentView addSubview:self.grayLine];
    [self.contentView addSubview:self.likeUserBar];
    [self.contentView addSubview:self.bottoLine];
    
    [self.threadToolBar configToolBarAction:self like:nil reply:nil share:@selector(threadFavoriteAction:)];
    
}


-(void)updateSectionView:(DZQDataThread *)dataModel sectionLayout:(DZDSectionStyle *)layout{
    
    NSArray *likeArray = dataModel.relationships.firstPost.relationships.likedUsers;
    
    [self.rewardPayView updateThreadPayView:dataModel payLayout:layout.frame_PayView];
    [self.threadToolBar updateDetailToolBar:dataModel toolLayout:layout.frame_toolBar];
    
    [self.likeUserBar updateAUserListBar:likeArray name:@"点赞"];
    
    [self layoutThreadDetailSection:layout];
}


-(void)layoutThreadDetailSection:(DZDSectionStyle *)layout{
    
    self.rewardPayView.frame = layout.kf_PayView;
    self.threadToolBar.frame = layout.kf_toolBar;
    
    self.grayLine.frame = layout.kf_Line;
    self.likeUserBar.frame = layout.kf_listOne;
    self.bottoLine.frame = layout.kf_bottomLine;
    
}

-(void)threadFavoriteAction:(UIButton *)button{
    button.selected = !button.isSelected;
    
    [DZThreadHelper thread_FavoriteCellAction:nil];
}

-(DZThreadCashPayView *)rewardPayView{
    if (!_rewardPayView) {
        _rewardPayView = [[DZThreadCashPayView alloc] initWithFrame:CGRectZero];
    }
    return _rewardPayView;
}

-(DZThreadToolBar *)threadToolBar{
    if (!_threadToolBar) {
        _threadToolBar = [[DZThreadToolBar alloc] initWithFrame:CGRectZero];
    }
    return _threadToolBar;
}

-(UIView *)grayLine{
    if (!_grayLine) {
        _grayLine = [[UIView alloc] initWithFrame:CGRectZero];
        _grayLine.backgroundColor = KLine_Color;
    }
    return _grayLine;
}

-(DZAUserListBar *)likeUserBar{
    if (!_likeUserBar) {
        _likeUserBar = [[DZAUserListBar alloc] initWithFrame:CGRectZero];
    }
    return _likeUserBar;
}

-(UIView *)bottoLine{
    if (!_bottoLine) {
        _bottoLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottoLine.backgroundColor = KLine_Color;
    }
    return _bottoLine;
}


@end
