//
//  DZThreadStick.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/7.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadStick.h"

@interface DZThreadStick ()

@property (nonatomic, strong) UIButton *postTag;  //!< 主题标记（置顶）
@property (nonatomic, strong) DZLabel *titleLabel;  //!< 标题
@property (nonatomic, strong) UIView *bottomLine;  //!< 分割线

@end

@implementation DZThreadStick

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.postTag];
        [self addSubview:self.titleLabel];
        [self addSubview:self.bottomLine];
    }
    return self;
}


- (void)updateStickBar:(DZThreadListStyle *)listStyle{
    
    self.titleLabel.attributedText = listStyle.summaryAttributeStr;
    
}



-(void)layoutSubviews{
    [super layoutSubviews];
    self.postTag.frame = CGRectMake(kMargin15, kMargin10, 24.f, 24.f);
    self.titleLabel.frame = CGRectMake(self.postTag.right + kMargin10, 0, self.width - CGRectGetMaxX(self.postTag.frame) - kMargin10 - kMargin15, self.height);
    self.bottomLine.frame = CGRectMake(kMargin10, self.height-2.f, self.width - kMargin20, 2.f);
}

-(UIButton *)postTag{
    if (!_postTag) {
        _postTag = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(12) titleColor:KTitle_Color normalImgPath:@"dz_list_tag_top" touchImgPath:@"dz_list_tag_top" isBackImage:YES picAlpha:1];
        _postTag.layer.cornerRadius = 3.f;
        [_postTag.layer masksToBounds];
    }
    return _postTag;
}


-(DZLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentLeft];
        _titleLabel.contentMode = UIViewContentModeCenter;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}

@end
