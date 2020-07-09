//
//  DZThreadHead.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  高度 60

#import "DZThreadHead.h"
#import "DZThreadListStyle.h"

@interface DZThreadHead ()

@property (nonatomic, strong) UIButton *avatar;  //!< 头像
@property (nonatomic, strong) UILabel *nameLabel;  //!< 昵称
@property (nonatomic, strong) UILabel *gradeLabel;  //!< 等级(用户组)
@property (nonatomic, strong) UILabel *timeLabel;  //!< 最近更新时间
@property (nonatomic, strong) UIImageView *userTag;  //!< 是否认证用户

@property (nonatomic, strong) UIImageView *threadTag;  //!< 置顶 或 精华 标记
@property (nonatomic, strong) UIButton *moreButton;  //!< 更多按钮（举报按钮）

@end

@implementation DZThreadHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.avatar];
        [self addSubview:self.nameLabel];
        [self addSubview:self.gradeLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.userTag];
        
        [self addSubview:self.threadTag];
        [self addSubview:self.moreButton];
    }
    return self;
}

- (void)updateThreadUserBar:(DZQDataThread *)dataModel style:(DZDHeadStyle *)listStyle{
    
    DZQThreadRelationModel *relateModel = dataModel.relationships;
    
    self.nameLabel.text = relateModel.user.attributes.username;
    self.gradeLabel.text = nil;
    self.timeLabel.text = relateModel.firstPost.attributes.createdAt;
    
    self.userTag.hidden = !relateModel.user.attributes.isReal;
    self.threadTag.hidden = !dataModel.attributes.isEssence;  // 目前只显示 加精
    
    [self.avatar dz_setImageWithURL:relateModel.user.attributes.avatarUrl forState:UIControlStateNormal];

    [self layoutCellHead:listStyle.frame_user];
}

-(void)layoutCellHead:(DZDUserStyle *)userLayout{
    
    self.avatar.frame = userLayout.kf_avatar;
    self.nameLabel.frame = userLayout.kf_userName;
    self.gradeLabel.frame = userLayout.kf_grade;
    self.threadTag.frame = userLayout.kf_threadTag;
    self.timeLabel.frame = userLayout.kf_time;
    self.userTag.frame = userLayout.kf_userTag;;
    self.moreButton.frame = userLayout.kf_postMore;
    
    self.avatar.layer.cornerRadius = userLayout.kf_avatar.size.height/2.f;
    self.avatar.clipsToBounds = YES;
}

-(void)configHeadAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel{
   
    [self.avatar addTarget:target action:avatarSel forControlEvents:UIControlEventTouchUpInside];
    [self.moreButton addTarget:target action:moreSel forControlEvents:UIControlEventTouchUpInside];
    
}



- (UIButton *)avatar{
    if (!_avatar) {
        _avatar = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"noavatar_small" touchImgPath:@"noavatar_small" isBackImage:YES picAlpha:1];
    }
    return _avatar;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero title:@"--" titleColor:KColor(K2A2C2F_Color, 1.0) font:KBoldFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

/// 用户认证标识
-(UIImageView *)userTag{
    if (!_userTag) {
        _userTag = [[UIImageView alloc] initWithFrame:CGRectZero];
        _userTag.image = KImageNamed(@"dz_user_real");
    }
    return _userTag;
}

-(UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(12) textAlignment:NSTextAlignmentLeft];
    }
    return _gradeLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(12.f) textAlignment:NSTextAlignmentLeft];
    }
    return _timeLabel;
}


-(UIImageView *)threadTag{
    if (!_threadTag) {
        _threadTag = [[UIImageView alloc] initWithFrame:CGRectZero];
        _threadTag.image = KImageNamed(@"dz_list_tag_elite");// 精华标
    }
    return _threadTag;
}

-(UIButton *)moreButton{
    if (!_moreButton) {
       _moreButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"dz_list_more" touchImgPath:@"dz_list_more" isBackImage:YES picAlpha:1];
    }
    return _moreButton;
}




@end
