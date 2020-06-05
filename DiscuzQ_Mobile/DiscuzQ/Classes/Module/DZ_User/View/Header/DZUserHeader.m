//
//  DZUserHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserHeader.h"
#import "DZQToolBarView.h"
#import "DZQHeaderView.h"

@interface DZUserHeader ()

@property(nonatomic,strong) UIView *thinline;
@property(nonatomic,strong) UIView *bottomline;
@property(nonatomic,strong) DZQHeaderView *headerV;
@property(nonatomic,strong) DZQToolBarView *toolBarV;

@end

@implementation DZUserHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_DUserHeader];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)config_DUserHeader{
    
    [self addSubview:self.headerV];
    [self addSubview:self.thinline];
    [self addSubview:self.toolBarV];
    [self addSubview:self.bottomline];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchUserProfileAction)];
    [self.headerV addGestureRecognizer:tapGes];
    
    [self.headerV.avatarView addTarget:self action:@selector(touchUserAvatarAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.toolBarV configAction:self fans:@selector(fansButtonAction) follow:@selector(followButtonAction) topic:@selector(topicButtonAction)];
}

-(void)updateUserListHeader:(DZQUserModel *)userModel relate:(DZQProfileRelationModel *)relate{
    
    DZQDataGroup *dataGroup = (DZQDataGroup *)relate.groups.firstObject;
    [self.headerV updateHeader:userModel group:dataGroup.attributes];
    [self.toolBarV updateFans:userModel.fansCount follow:userModel.follow topic:userModel.threadCount];
}


// 用户头像
-(void)touchUserAvatarAction{
    if (self.headerAction) { self.headerAction(cell_avatar); }
}

// 个人详情主页
-(void)touchUserProfileAction{
    if (self.headerAction) { self.headerAction(cell_profile); }
}

-(void)fansButtonAction{
    if (self.headerAction) { self.headerAction(cell_fans); }
}

-(void)followButtonAction{
    if (self.headerAction) { self.headerAction(cell_follow); }
}

-(void)topicButtonAction{
    if (self.headerAction) { self.headerAction(cell_topic); }
}

-(DZQHeaderView *)headerV{
    if (!_headerV) {
        _headerV = [[DZQHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.width, 90.f)];
    }
    return _headerV;
}

-(UIView *)thinline{
    if (!_thinline) {
        _thinline = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerV.bottom + kMargin5, self.width,1.0)];
        _thinline.backgroundColor = KLine_Color;
    }
    return _thinline;
}

-(DZQToolBarView *)toolBarV{
    if (!_toolBarV) {
        _toolBarV = [[DZQToolBarView alloc] initWithFrame:CGRectMake(0, self.thinline.bottom, self.width, kToolBarHeight)];
    }
    return _toolBarV;
}

-(UIView *)bottomline{
    if (!_bottomline) {
        _bottomline = [[UIView alloc] initWithFrame:CGRectMake(0, self.toolBarV.bottom, self.width, kMargin5)];
        _bottomline.backgroundColor = KLine_Color;
    }
    return _bottomline;
}




@end










