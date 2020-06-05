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

@property (nonatomic, strong) UIButton *ViewButton;  //!< 浏览数
@property (nonatomic, strong) UIButton *replyButton;  //!< 回复数
@property (nonatomic, strong) UIView *sepLine;  //!< 分割线
@end

@implementation DZThreadBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.zanButton];
        [self addSubview:self.ViewButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.sepLine];
    }
    return self;
}

- (void)updateThreadBottomBar:(DZThreadListModel *)Model{
    
    [self.ViewButton setTitle:checkTwoStr(@" ", Model.views) forState:UIControlStateNormal];
    [self.replyButton setTitle:checkTwoStr(@" ", Model.replies) forState:UIControlStateNormal];
    [self.zanButton setTitle:checkTwoStr(@" ", Model.recommend_add) forState:UIControlStateNormal];
    
    self.zanButton.selected = [Model.recommend isEqualToString:@"1"];
    self.zanButton.enabled = [Model.recommend isEqualToString:@"1"] ? NO : YES;
    
    [self layoutCellBottomBar:Model.listLayout.bottomLayout];
}

-(void)layoutCellBottomBar:(DZTHBottomLayout *)layout{
    
    self.ViewButton.frame = layout.viewFrame;
    self.replyButton.frame = layout.replyFrame;
    self.zanButton.frame = layout.zanFrame;
    self.sepLine.frame = layout.lineFrame;
}

- (UIButton *)ViewButton{
    if (!_ViewButton) {
        _ViewButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"浏览: -" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"list_see" touchImgPath:@"list_see" isBackImage:NO];
        [_ViewButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _ViewButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _ViewButton;
}

- (UIButton *)replyButton{
    if (!_replyButton) {
        _replyButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"回复: -" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"list_message" touchImgPath:@"list_message" isBackImage:NO];
        [_replyButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _replyButton;
}

- (UIButton *)zanButton{
    if (!_zanButton) {
        _zanButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"点赞: -" titleFont:KFont(12) titleColor:KColor(K2A2C2F_Color, 1.0) normalImgPath:@"list_zan" touchImgPath:@"list_zan_high" isBackImage:NO];
        [_zanButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5];
        _zanButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _zanButton;
}

-(UIView *)sepLine{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] init];
        _sepLine.backgroundColor = KLine_Color;
    }
    return _sepLine;
}

@end
