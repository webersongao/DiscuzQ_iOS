//
//  DZTopicHeaderView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZTopicHeaderView.h"

@interface DZTopicHeaderView ()

@property(nonatomic,strong) UILabel *nameLabel;

@property(nonatomic,strong) UILabel *viewNoLabel;
@property(nonatomic,strong) UILabel *threadNoLabel;  // 主题数量
@property(nonatomic,strong) UIButton *filterButton;  // 筛选按钮

@property(nonatomic,strong) UIButton *rightSkipButton;
@property(nonatomic,strong) CALayer *bottomlineLayer;
@end

@implementation DZTopicHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isReady = NO;
        [self config_tHeaderView];
    }
    return self;
}

-(void)config_tHeaderView{
    [self addSubview:self.nameLabel];
    [self addSubview:self.viewNoLabel];
    [self addSubview:self.threadNoLabel];
    
    [self addSubview:self.filterButton];
    self.backgroundColor = KDebug_Color;
    [self addSubview:self.rightSkipButton];
    [self.layer addSublayer:self.bottomlineLayer];
}


-(void)updateTopicDetailHeader:(DZQDataTopic *)dataTopic{
    
    self.isReady = dataTopic.attributes.content.length ? YES : NO;
    self.nameLabel.text = [NSString stringWithFormat:@"#%@#",dataTopic.attributes.content];
    self.viewNoLabel.text = checkTwoStr(@"热度:", checkIntegerStr((long)dataTopic.attributes.view_count));
    self.threadNoLabel.text = checkTwoStr(@"主题数:", checkIntegerStr((long)dataTopic.attributes.thread_count));
    
}


-(void)configTAction:(id)target skip:(SEL)skipAction filter:(SEL)filterAction{
    
    [self.rightSkipButton addTarget:target action:skipAction forControlEvents:UIControlEventTouchUpInside];
    [self.filterButton addTarget:target action:filterAction forControlEvents:UIControlEventTouchUpInside];
}


-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectMake(kMargin15, kMargin10, self.width-150, 30) title:@"话题名称" titleColor:KTitle_Color font:KBoldFont(20.f) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

-(UIButton *)rightSkipButton{
    if (!_rightSkipButton) {
        _rightSkipButton = [UIButton ButtonTextWithFrame:CGRectMake(self.right - kMargin15 - 100, self.nameLabel.top,100, 32.f) titleStr:@"话题列表_→" titleColor:KLightContent_Color titleTouColor:KTitle_Color font:KBoldFont(16) Radius:4.f Target:self action:nil];
        _rightSkipButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _rightSkipButton;
}

-(UILabel *)viewNoLabel{
    if (!_viewNoLabel) {
        _viewNoLabel = [UILabel labelWithFrame:CGRectMake(kMargin15, self.nameLabel.bottom + kMargin15, (self.width-kMargin30)/3.0, kToolBarHeight) title:@"热度：" titleColor:KContent_Color font:KFont(16.f) textAlignment:NSTextAlignmentLeft];
    }
    return _viewNoLabel;
}

-(UILabel *)threadNoLabel{
    if (!_threadNoLabel) {
        _threadNoLabel = [UILabel labelWithFrame:CGRectMake(kMargin15+(self.width-kMargin30)/3.0, self.nameLabel.bottom + kMargin15, (self.width-kMargin30)/3.0, kToolBarHeight) title:@"主题数：" titleColor:KContent_Color font:KFont(16.f) textAlignment:NSTextAlignmentCenter];
    }
    return _threadNoLabel;
}

-(UIButton *)filterButton{
    if (!_filterButton) {
        _filterButton = [UIButton ButtonTextWithFrame:CGRectMake(self.width-kMargin15-((self.width-kMargin30)/3.0), self.nameLabel.bottom + kMargin15, (self.width-kMargin30)/3.0, kToolBarHeight) titleStr:@"筛选项↕" titleColor:KContent_Color titleTouColor:KTitle_Color font:KFont(16) Radius:4.f Target:self action:nil];
        _filterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _filterButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return _filterButton;
}

-(CALayer *)bottomlineLayer{
    if (!_bottomlineLayer) {
        _bottomlineLayer = [[CALayer alloc] init];
        _bottomlineLayer.frame = CGRectMake(0, self.height-8, self.width, 8);
        _bottomlineLayer.backgroundColor = KLine_Color.CGColor;
    }
    return _bottomlineLayer;
}
@end
