//
//  DZImageSquareCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/2.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZImageSquareCell.h"
#import "DZBaseForumModel.h"

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
    
    self.iconV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discuz_cor_logo"]];
    [self.contentView addSubview:self.iconV];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.font = KFont(15);
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
    
    //    self.postsLab = [[UILabel alloc] init];
    //    self.postsLab.font = KFont(10);
    //    self.postsLab.textColor = KGray_Color;
    //    [self.contentView addSubview:self.postsLab];
    
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


/**
 * 设置数据
 */
- (void)updateItemCell:(DZBaseForumModel *)infoModel {
    
    self.titleLab.text = infoModel.name.length ? infoModel.name : @"--";
    
    
    if (infoModel.threads.length) {
        NSString *threads = [NSString stringWithFormat:@"主题:%@",infoModel.threads];
        if ([DataCheck isValidString:infoModel.todayposts] && [infoModel.todayposts integerValue] > 0) {
            
            NSString *todays = [NSString stringWithFormat:@"(%@)",infoModel.todayposts];
            NSMutableAttributedString *describe = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",threads,todays]];
            NSRange todayRange = NSMakeRange(describe.length - todays.length, todays.length);
            [describe addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:todayRange];
            self.numLab.attributedText = describe;
        } else {
            self.numLab.text = threads;
        }
    } else {
        self.numLab.text = @"主题:--";
    }
    
    [self.iconV dz_setImageWithURL:infoModel.icon placeholder:[UIImage imageNamed:@"discuz_cor_logo"]];
    
    [self layoutIfNeeded];
    
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
