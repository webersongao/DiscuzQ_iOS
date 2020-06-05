//
//  DZSubForumCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/22.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZSubForumCell.h"
#import "ForumNodeModel.h"
#import "ForumModel.h"
#import "NSString+MoreMethod.h"

@interface DZSubForumCell()

@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *postsLab;
@property (nonatomic, strong) UIImageView *AccessoryV;


@end

@implementation DZSubForumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView {
    self.iconV = [[UIImageView alloc] init];
    self.iconV.image = KImageNamed(@"discuz_cor_logo");
    self.iconV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.iconV];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.font = KFont(15);
    [self.contentView addSubview:self.titleLab];
    
    self.numLab = [[UILabel alloc] init];
    self.numLab.font = KFont(14);
    self.numLab.textColor = KGray_Color;
    [self.contentView addSubview:self.numLab];
    
    self.postsLab = [[UILabel alloc] init];
    self.postsLab.font = KFont(14);
    self.postsLab.textColor = KGray_Color;
    [self.contentView addSubview:self.postsLab];
    
    self.AccessoryV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"to"]];
    [self.contentView addSubview:self.AccessoryV];
    
    [self.iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@10);
        make.height.width.equalTo(self.mas_height).offset(-20);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(10);
        make.top.equalTo(self.iconV);
        make.right.equalTo(self.AccessoryV.mas_left).offset(-5);
        make.height.mas_equalTo(self.iconV.mas_height).multipliedBy(0.5);
    }];
    
    [self.AccessoryV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self.titleLab);
        make.width.equalTo(@9);
        make.height.equalTo(@16);
    }];
    
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.width.equalTo(self.titleLab).multipliedBy(0.4);
    }];
    
    [self.postsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLab.mas_right).offset(5);
        make.top.equalTo(self.numLab);
        make.width.height.equalTo(self.numLab);
    }];
    
}

/**
 * 设置数据
 */
- (void)setInfo:(ForumModel *)infoModel {
    //    self.textLabel.text = node.infoModel.name;
    
    self.titleLab.text = infoModel.name;
    
    if ([DataCheck isValidString:infoModel.threads]) {
        self.numLab.text = [NSString stringWithFormat:@"主题：%@",infoModel.threads];
    } else {
        self.numLab.text = @"主题：-";
    }
    if ([DataCheck isValidString:infoModel.posts]) {
        self.postsLab.text = [NSString stringWithFormat:@"帖数：%@",infoModel.posts];
    } else {
        self.postsLab.text = @"帖数：-";
    }
    
    
    [self.iconV dz_setImageWithURL:infoModel.icon placeholder:[UIImage imageNamed:@"discuz_cor_logo"]];
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconV.layer.masksToBounds = YES;
    self.iconV.layer.cornerRadius = 8;
    
}



@end

