//
//  ForumInfoView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "ForumInfoView.h"

@interface ForumInfoView()

@property (nonatomic, strong) UIView *sepLine;

@end

@implementation ForumInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.IconV = [[UIImageView alloc] init];
    self.IconV.contentMode = UIViewContentModeScaleAspectFit;
    self.IconV.image = [UIImage imageNamed:@"forumCommon_l"];
    [self addSubview:self.IconV];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.textColor = K_Color_Theme;
    self.titleLab.font = KFont(17);
    [self addSubview:self.titleLab];
    self.titleLab.text = @"";
    
    self.todayPostLab = [[UILabel alloc] init];
    self.todayPostLab.textColor = KGray_Color;
    self.todayPostLab.font = KFont(12);
    [self addSubview:self.todayPostLab];
    self.todayPostLab.text = @"今日：0";
    
    self.threadsLab = [[UILabel alloc] init];
    self.threadsLab.textColor = KGray_Color;
    self.threadsLab.font = KFont(12);
    [self addSubview:self.threadsLab];
    self.threadsLab.text = @"主题：0";
    
    self.bankLab = [[UILabel alloc] init];
    self.bankLab.textColor = KGray_Color;
    self.bankLab.font = KFont(12);
    [self addSubview:self.bankLab];
    self.bankLab.text = @"排名：暂无";
    
    self.sepLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, KScreenWidth, 0.5)];
    self.sepLine.backgroundColor = KLine_Color;
    [self addSubview:self.sepLine];
    
    
    //收藏按钮
    self.collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_collectionBtn setImage:[UIImage imageTintColorWithName:@"collection_no" superView:_collectionBtn] forState:UIControlStateNormal];
    _collectionBtn.tintColor = K_Color_Theme;
    _collectionBtn.tag =1000;
    _collectionBtn.cs_acceptEventInterval = 1;
    [self addSubview:self.collectionBtn];
    
//    75 - 20 = 55
    [self.IconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@10);
        make.height.width.equalTo(@55);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.IconV.mas_right).offset(10);
        make.top.equalTo(self.IconV);
        make.width.equalTo(@200);
        make.height.equalTo(self.IconV).multipliedBy(0.5);
    }];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.top.equalTo(self.IconV);
        make.width.equalTo(@58);
        make.height.equalTo(@26);
    }];

    [self.todayPostLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.width.equalTo(@(kCellHeight_65));
        make.height.equalTo(self.IconV).multipliedBy(0.5).offset(-10);
    }];

    [self.threadsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.todayPostLab.mas_right).offset(10);
        make.top.equalTo(self.todayPostLab);
        make.width.equalTo(self.todayPostLab).offset(10);
        make.height.equalTo(self.todayPostLab);
    }];

    [self.bankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.threadsLab.mas_right).offset(10);
        make.top.equalTo(self.threadsLab);
        make.width.height.equalTo(self.todayPostLab);
    }];
    
    [self addSubview:self.describLab];
    self.describLab.numberOfLines = 2;
    [self.describLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.IconV.mas_bottom).offset(8);
        make.left.equalTo(self.IconV);
        make.width.mas_equalTo(KScreenWidth - 30);
    }];

    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(self.describLab.mas_bottom).offset(10);
        make.width.mas_equalTo(KScreenWidth);
        make.height.equalTo(@5);
    }];
//    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.bottom.equalTo(self);
//        make.width.mas_equalTo(WIDTH);
//        make.height.equalTo(@5);
//    }];
    
    [self layoutIfNeeded];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.IconV.layer.masksToBounds = YES;
    self.IconV.layer.cornerRadius = 8;
}

- (UILabel *)describLab {
    if (!_describLab) {
        _describLab = [[UILabel alloc] init];
        _describLab.textColor = KBlack_Color;
        _describLab.font = KFont(14);
    }
    return _describLab;
}

@end
