//
//  DZThreadBottomBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"

@interface DZThreadBottomBar ()

@end

@implementation DZThreadBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftButton];
        [self addSubview:self.centerButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.bottomLine];
    }
    return self;
}

-(void)updateBottombar:(DZQDataThread *)dataThread Layout:(DZDToolBarStyle *)modelLayout{
    
    DZQPostV1 *postModel = dataThread.relationships.firstPost.attributes;
    
    self.leftButton.selected = postModel.isLiked;
    [self.leftButton setTitle:checkIntegerStr(postModel.likeCount) forState:UIControlStateNormal];
    [self.centerButton setTitle:checkIntegerStr(dataThread.attributes.postCount) forState:UIControlStateNormal];
    
    self.leftButton.frame = modelLayout.kf_left;
    self.rightButton.frame = modelLayout.kf_right;
    self.centerButton.frame = modelLayout.kf_center;
    
    self.bottomLine.frame = modelLayout.kf_barLine;
}


-(void)configToolBarAction:(id)target left:(SEL)likeSel center:(SEL)replySel right:(SEL)shareSel{
   
    [self.leftButton addTarget:target action:likeSel forControlEvents:UIControlEventTouchUpInside];
    [self.centerButton addTarget:target action:replySel forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:target action:shareSel forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_praise_n" touchImgPath:@"dz_list_praise_f" isBackImage:NO picAlpha:0.5];
        [_leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _leftButton;
}

- (UIButton *)centerButton{
    if (!_centerButton) {
        _centerButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_comment" touchImgPath:@"dz_list_comment" isBackImage:NO picAlpha:0.5];
        [_centerButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _centerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _centerButton;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KGray_Color normalImgPath:@"dz_list_share" touchImgPath:@"dz_list_share" isBackImage:NO picAlpha:0.5];
        [_rightButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:3];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _rightButton;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}




@end
