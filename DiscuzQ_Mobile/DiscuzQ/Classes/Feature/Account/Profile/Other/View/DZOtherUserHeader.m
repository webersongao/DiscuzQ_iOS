// 放头像，用户名，身份
//  DZOtherUserHeader.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZOtherUserHeader.h"
#import "DZUserHelper.h"

@interface DZOtherUserHeader ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *groupLabel;
@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel *signatureLabel;  // 签名

@property (nonatomic, strong) UIButton *followButton; // 关注按钮
@property (nonatomic, strong) UIButton *messageButton; // 私信

@property (nonatomic, weak) DZQBaseUserV1 *innerUser;  //!< 属性注释

@end

@implementation DZOtherUserHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_userHeader];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

- (void)config_userHeader {
    
    [self addSubview:self.headView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.groupLabel];
    [self addSubview:self.followButton];
    [self addSubview:self.messageButton];
    [self addSubview:self.signatureLabel];
    
    [self addSubview:[DZViewHelper lineView:CGRectMake(0, self.height-kMargin5, self.width, kMargin5)]];
}

-(void)updateInfoHeader:(DZQBaseUserV1 *)userModel grade:(NSString *)grade{
   
    self.innerUser = userModel;
    self.groupLabel.text = checkNull(grade);
    self.nameLabel.text = checkNull(userModel.username);
    [self.headView dz_setOptionImageWithURL:userModel.avatarUrl placeholder:KImageNamed(@"dz_logo_banCircle") options:YYWebImageOptionRefreshImageCache];
}


-(void)sendMsgToOtherUser:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToMsgChatController:nil];
}

-(void)followOtherUserAction:(UIButton *)button{
    
    [DZUserHelper user_HeaderCellFollowAction:self.innerUser.user_id current:button.isSelected block:^(BOOL boolState) {
        button.selected = boolState;
    }];
}


- (UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin15, kMargin15, kCellHeight_60, kCellHeight_60)];
        _headView.layer.masksToBounds = YES;
        _headView.image = [UIImage imageNamed:@"dz_logo_banCircle"];
        _headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _headView.layer.cornerRadius = CGRectGetWidth(self.headView.frame) / 2.0;
    }
    return _headView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectMake(self.headView.right+kMargin15, self.headView.top+kMargin15, self.width-250, 20) title:@"---" titleColor:KTitle_Color fontSize:18.f textAlignment:NSTextAlignmentLeft];
        _nameLabel.font = KBoldFont(17.f);
    }
    return _nameLabel;
}

-(UILabel *)groupLabel{
    if (!_groupLabel) {
        _groupLabel = [UILabel labelWithFrame:CGRectMake(self.headView.right+kMargin15, self.headView.bottom-15, self.nameLabel.width, 15) title:@"新手上路" titleColor:KLightContent_Color fontSize:13.f textAlignment:NSTextAlignmentLeft];
    }
    return _groupLabel;
}

-(UILabel *)signatureLabel{
    if (!_signatureLabel) {
        _signatureLabel = [UILabel labelWithFrame:CGRectMake(self.headView.left, self.headView.bottom+kMargin15, self.width-kMargin30, 20) title:DZ_UserSignture titleColor:KContent_Color fontSize:16.f textAlignment:NSTextAlignmentLeft];
    }
    return _signatureLabel;
}

-(UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [UIButton ButtonNormalWithFrame:CGRectMake(self.followButton.left-(kMargin15 + 45), self.headView.centerX-kMargin20, 45, 20) title:@"私信" titleFont:KFont(14) titleColor:KContent_Color normalImgPath:@"" touchImgPath:@"" isBackImage:NO picAlpha:1];
        _messageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_messageButton setTitleColor:KGreen_Color forState:UIControlStateSelected];
        [_messageButton setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
        _messageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_messageButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_normal"] forState:UIControlStateNormal];
        [_messageButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_down"] forState:UIControlStateSelected];
        [_messageButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_down"] forState:UIControlStateHighlighted];
        [_messageButton addTarget:self action:@selector(sendMsgToOtherUser:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}


-(UIButton *)followButton{
    if (!_followButton) {
        _followButton = [UIButton ButtonNormalWithFrame:CGRectMake(self.width-(45 + kMargin15), self.headView.centerX-kMargin20, 45, 20) title:@"关注" titleFont:KFont(14) titleColor:KContent_Color normalImgPath:@"" touchImgPath:@"" isBackImage:NO picAlpha:1];
        _followButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_followButton setTitle:@"已关注" forState:UIControlStateSelected];
        [_followButton setTitleColor:KGreen_Color forState:UIControlStateSelected];
        [_followButton setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
        _followButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_followButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_normal"] forState:UIControlStateNormal];
        [_followButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_down"] forState:UIControlStateSelected];
        [_followButton setBackgroundImage:[UIImage resizeImage:@"dz_list_btn_down"] forState:UIControlStateHighlighted];
        [_messageButton addTarget:self action:@selector(followOtherUserAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _followButton;
}

@end
