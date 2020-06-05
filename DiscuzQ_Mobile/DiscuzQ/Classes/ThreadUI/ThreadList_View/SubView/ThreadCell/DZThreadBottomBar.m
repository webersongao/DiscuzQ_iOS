//
//  DZThreadBottomBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"
#import "DZThreadListModel.h"

@interface DZThreadBottomBar ()

@property (nonatomic, strong) UIButton *likeButton;  //!< 点赞数
@property (nonatomic, strong) UIButton *replyButton;  //!< 回复数
@property (nonatomic, strong) UIButton *shareButton;  //!< 浏览数
@property (nonatomic, strong) UIView *sepLine;  //!< 分割线
@end

@implementation DZThreadBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.likeButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.shareButton];
        [self addSubview:self.sepLine];
    }
    return self;
}

-(void)updateBottombarLayout:(DZDToolBarStyle *)layout{
    
    self.likeButton.frame = layout.kf_left;
    self.shareButton.frame = layout.kf_right;
    self.replyButton.frame = layout.kf_center;
    
    self.sepLine.frame = layout.kf_barLine;
}


-(void)configBarAction:(id)target like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel{
   
    [self.likeButton addTarget:target action:likeSel forControlEvents:UIControlEventTouchUpInside];
    [self.replyButton addTarget:target action:replySel forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:target action:shareSel forControlEvents:UIControlEventTouchUpInside];
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

- (UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"dz_list_share" touchImgPath:@"dz_list_share" isBackImage:NO];
        [_shareButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _shareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _shareButton;
}

-(UIView *)sepLine{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] init];
        _sepLine.backgroundColor = KGroupLine_Color;
    }
    return _sepLine;
}

@end
