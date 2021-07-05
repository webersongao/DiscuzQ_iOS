//
//  DZQToolBarView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQToolBarView.h"

@interface DZQToolBarView ()

@property(nonatomic,strong) UIButton *fansButton;
@property(nonatomic,strong) UIButton *followButton;
@property(nonatomic,strong) UIButton *topicButton;

@end

@implementation DZQToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configToolBarView];
    }
    return self;
}

-(void)configToolBarView{
    
    [self addSubview:self.fansButton];
    [self addSubview:self.followButton];
    [self addSubview:self.topicButton];
}

// 更新数据
-(void)updateFans:(NSInteger)fans follow:(NSInteger)follow thread:(NSInteger)thread{
    
    [self.fansButton setTitle:checkTwoStr(@"粉丝数: ", checkInteger(fans)) forState:UIControlStateNormal];
    [self.followButton setTitle:checkTwoStr(@"关注数: ", checkInteger(follow)) forState:UIControlStateNormal];
    [self.topicButton setTitle:checkTwoStr(@"主题数: ", checkInteger(thread)) forState:UIControlStateNormal];
}

-(void)configAction:(id)target fans:(SEL)fction follow:(SEL)followction topic:(SEL)topiction{
    
    [self.fansButton addTarget:target action:fction forControlEvents:UIControlEventTouchUpInside];
    [self.topicButton addTarget:target action:topiction forControlEvents:UIControlEventTouchUpInside];
    [self.followButton addTarget:target action:followction forControlEvents:UIControlEventTouchUpInside];
}



-(UIButton *)fansButton{
    if (!_fansButton) {
        _fansButton = [UIButton ButtonTextWithFrame:CGRectMake(0, 0, self.width/3.0, self.height) titleStr:@"粉丝" titleColor:KBlack_Color titleTouColor:KBlack_Color font:KFont(14) Radius:2.f Target:self action:nil];
    }
    return _fansButton;
}

-(UIButton *)followButton{
    if (!_followButton) {
        _followButton = [UIButton ButtonTextWithFrame:CGRectMake(self.width/3.0, 0, self.width/3.0, self.height) titleStr:@"关注" titleColor:KBlack_Color titleTouColor:KBlack_Color font:KFont(14) Radius:2.f Target:self action:nil];
    }
    return _followButton;
}

-(UIButton *)topicButton{
    if (!_topicButton) {
        _topicButton = [UIButton ButtonTextWithFrame:CGRectMake((self.width/3.0)*2, 0, self.width/3.0, self.height) titleStr:@"主题" titleColor:KBlack_Color titleTouColor:KBlack_Color font:KFont(14) Radius:2.f Target:self action:nil];
    }
    return _topicButton;
}



@end
