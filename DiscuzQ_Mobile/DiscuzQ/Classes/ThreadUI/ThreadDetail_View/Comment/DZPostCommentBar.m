//
//  DZPostCommentBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostCommentBar.h"

@interface DZPostCommentBar ()

@property (nonatomic, strong) UIButton *likeButton;  //!< 点赞
@property (nonatomic, strong) UIButton *replyButton;  //!< 评论
@property (nonatomic, strong) DZLabel *timeLabel;  //!< 回复发布时间
@property (nonatomic, strong) UIView *bottomLine;  //!< 属性注释

@end


@implementation DZPostCommentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_CommentBar];
        self.backgroundColor = KRandom_Color;
    }
    return self;
}


-(void)config_CommentBar{
    
    [self addSubview:self.timeLabel];
    [self addSubview:self.likeButton];
    [self addSubview:self.replyButton];
    [self addSubview:self.bottomLine];
}

-(void)updateCommentBar:(DZDToolBarStyle *)toolLayout{
    
    self.timeLabel.frame = toolLayout.kf_left;
    self.likeButton.frame = toolLayout.kf_center;
    self.replyButton.frame = toolLayout.kf_right;
    self.bottomLine.frame = toolLayout.kf_barLine;
}


- (UIButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"dz_list_praise_n" touchImgPath:@"dz_list_praise_f" isBackImage:NO];
        [_likeButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _likeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _likeButton;
}

- (UIButton *)replyButton{
    if (!_replyButton) {
        _replyButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"dz_list_comment" touchImgPath:@"dz_list_comment" isBackImage:NO];
        [_replyButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _replyButton;
}

- (DZLabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(12.f) textAlignment:NSTextAlignmentRight];
    }
    return _timeLabel;
}


-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}

@end
