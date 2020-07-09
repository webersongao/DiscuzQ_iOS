//
//  DZBaseUserInfoBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseUserInfoBar.h"

@interface DZBaseUserInfoBar ()

@property (nonatomic, strong) UIButton *avatar;  //!< 头像
@property (nonatomic, strong) UILabel *nameLabel;  //!< 昵称
@property (nonatomic, strong) DZLabel *timeLabel;  //!< 回复发布时间
@property (nonatomic, strong) UIImageView *userTag;  //!< 是否认证用户
@property (nonatomic, strong) UIView *sepLine;  //!< 分割线


@end

@implementation DZBaseUserInfoBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_UserView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}

-(void)config_UserView{
    
    [self addSubview:self.avatar];
    [self addSubview:self.nameLabel];
    [self addSubview:self.userTag];
    [self addSubview:self.timeLabel];
    [self addSubview:self.sepLine];
}

-(void)setIsSepLine:(BOOL)isSepLine{
    _isSepLine = isSepLine;
    self.sepLine.hidden = !isSepLine;
}


-(void)updateUserBar:(NSAttributedString *)attributedName avatar:(NSString *)avatar time:(NSString *)time real:(BOOL)isReal style:(DZDUserStyle *)userStyle{
    
    self.nameLabel.attributedText = attributedName;
    self.timeLabel.text = time;
    self.userTag.hidden = isReal ? NO : YES;
    [self.avatar dz_setImageWithURL:avatar forState:UIControlStateNormal placeholder:KImageNamed(DZQ_Cor_icon)];
    
    // 布局样式
    [self layoutBaseUserInfoBar:userStyle];
}


-(void)layoutBaseUserInfoBar:(DZDUserStyle *)userStyle{
    
    self.avatar.frame = userStyle.kf_avatar;
    self.nameLabel.frame = userStyle.kf_userName;
    
    self.userTag.frame = userStyle.kf_userTag;
    self.timeLabel.frame = userStyle.kf_time;
    
    self.sepLine.frame = userStyle.kf_bottomLine;
}



- (UIButton *)avatar{
    if (!_avatar) {
        _avatar = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"noavatar_small" touchImgPath:@"noavatar_small" isBackImage:YES picAlpha:1];
        _avatar.layer.cornerRadius = 17.f;
        _avatar.clipsToBounds = YES;
    }
    return _avatar;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero title:@"--" titleColor:KTitle_Color font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

/// 用户认证标识
-(UIImageView *)userTag{
    if (!_userTag) {
        _userTag = [[UIImageView alloc] initWithFrame:CGRectZero];
        _userTag.image = KImageNamed(@"check_select");
    }
    return _userTag;
}


- (DZLabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(12.f) textAlignment:NSTextAlignmentRight];
    }
    return _timeLabel;
}



-(UIView *)sepLine{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] initWithFrame:CGRectZero];
        _sepLine.backgroundColor = KLine_Color;
        _sepLine.hidden = YES;
    }
    return _sepLine;
}

@end
