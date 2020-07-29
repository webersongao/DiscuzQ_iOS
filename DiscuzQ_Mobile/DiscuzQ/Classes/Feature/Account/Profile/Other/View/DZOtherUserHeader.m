// 放头像，用户名，身份
//  DZOtherUserHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZOtherUserHeader.h"

@interface DZOtherUserHeader ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *groupLabel;
@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel *signatureLabel;  // 签名

@property (nonatomic, strong) UIButton *followButton; // 关注按钮
@property (nonatomic, strong) UIButton *messageButton; // 私信

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

-(void)updateInfoHeader:(NSString *)userName grade:(NSString *)grade icon:(NSString *)iconName{
   
    self.nameLabel.text = checkNull(userName);
    self.groupLabel.text = checkNull(grade);
    [self.headView dz_setOptionImageWithURL:iconName placeholder:KImageNamed(@"noavatar_small") options:YYWebImageOptionRefreshImageCache];
}


- (UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin15, kMargin15, kCellHeight_60, kCellHeight_60)];
        _headView.layer.masksToBounds = YES;
        _headView.image = [UIImage imageNamed:@"noavatar_small"];
        _headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _headView.layer.cornerRadius = CGRectGetWidth(self.headView.frame) / 2.0;
    }
    return _headView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectMake(self.headView.right+kMargin15, self.headView.top, self.width-250, 20) title:@"---" titleColor:KTitle_Color fontSize:18.f textAlignment:NSTextAlignmentLeft];
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
        _signatureLabel = [UILabel labelWithFrame:CGRectMake(self.headView.left, self.headView.bottom+kMargin15, self.width-kMargin30, 20) title:@"逼乎？无个性，不签名" titleColor:KContent_Color fontSize:16.f textAlignment:NSTextAlignmentLeft];
    }
    return _signatureLabel;
}

-(UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [UIButton ButtonNormalWithFrame:CGRectMake(self.width-150, self.headView.centerX-kMargin20, 60, 20) title:@"私信" titleFont:KFont(14) titleColor:KContent_Color normalImgPath:@"" touchImgPath:@"" isBackImage:NO picAlpha:1];
        _messageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _messageButton;
}


-(UIButton *)followButton{
    if (!_followButton) {
        _followButton = [UIButton ButtonNormalWithFrame:CGRectMake(self.width-75, self.headView.centerX-kMargin20, 60, 20) title:@"关注" titleFont:KFont(14) titleColor:KContent_Color normalImgPath:@"" touchImgPath:@"" isBackImage:NO picAlpha:1];
        _followButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _followButton;
}

@end
