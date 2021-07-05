//
//  DZImageSquareCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/2.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZImageSquareCell.h"

@interface DZImageSquareCell ()

@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *postsLab;

@end

@implementation DZImageSquareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    
    self.iconV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dz_logo_banCircle"]];
    [self.contentView addSubview:self.iconV];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.font = KFont(16);
    //    self.titleLab.numberOfLines = 0;
    //    self.titleLab.textAlignment = NSTextAlignmentLeft;
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:_titleLab];
    
    self.numLab = [[UILabel alloc] init];
    self.numLab.font = KFont(12);
    self.numLab.textAlignment = NSTextAlignmentCenter;
    self.numLab.textColor = KGray_Color;
    [self.contentView addSubview:self.numLab];
    
    [self.iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@8);
        make.width.height.equalTo(self.contentView.mas_width).offset(-16);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.top.equalTo(self.iconV.mas_bottom).offset(5);
        make.width.equalTo(self).offset(-10);
        make.height.equalTo(@30);
    }];
    
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.bottom.equalTo(self).offset(-8);
        make.width.equalTo(self).offset(-10);
        make.height.equalTo(@15);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.layer.borderWidth = 1;
    self.contentView.layer.borderColor = KLine_Color.CGColor;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 5;
    
    self.iconV.layer.masksToBounds = YES;
    self.iconV.layer.cornerRadius = 6;
}

@end
