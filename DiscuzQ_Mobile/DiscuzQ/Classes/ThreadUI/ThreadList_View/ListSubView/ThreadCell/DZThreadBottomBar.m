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

@end

@implementation DZThreadBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.likeButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.shareButton];
        [self addSubview:self.bottomLine];
    }
    return self;
}

-(void)updateBottombar:(DZQPostModel *)postModel Layout:(DZDToolBarStyle *)modelLayout{
    
    self.likeButton.selected = postModel.isLiked;
    [self.likeButton setTitle:checkInteger(postModel.likeCount) forState:UIControlStateNormal];
    [self.replyButton setTitle:checkInteger(postModel.replyCount) forState:UIControlStateNormal];
    
    self.likeButton.frame = modelLayout.kf_left;
    self.shareButton.frame = modelLayout.kf_right;
    self.replyButton.frame = modelLayout.kf_center;
    
    self.bottomLine.frame = modelLayout.kf_barLine;
}


-(void)configToolBarAction:(id)target like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel{
   
    [self.likeButton addTarget:target action:likeSel forControlEvents:UIControlEventTouchUpInside];
    [self.replyButton addTarget:target action:replySel forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:target action:shareSel forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_praise_n" touchImgPath:@"dz_list_praise_f" isBackImage:NO picAlpha:0.5];
        [_likeButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _likeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _likeButton;
}

- (UIButton *)replyButton{
    if (!_replyButton) {
        _replyButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_comment" touchImgPath:@"dz_list_comment" isBackImage:NO picAlpha:0.5];
        [_replyButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _replyButton;
}

- (UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_share" touchImgPath:@"dz_list_share" isBackImage:NO picAlpha:0.5];
        [_shareButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _shareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _shareButton;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}




@end
