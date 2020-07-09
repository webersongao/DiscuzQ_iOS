//
//  DZMessageListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMessageListCell.h"

@interface DZMessageListCell ()

@property (nonatomic, strong) UIView *sepLine;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel * numberLabel;

@end

@implementation DZMessageListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_MessageListCell];
    }
    return self;
}

- (void)config_MessageListCell {
    
    [self addSubview:self.sepLine];
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.numberLabel];
    
    
    [self layoutSectionHeader];
}


- (void)updateMessageListCell:(DZNotiItem *)cellModel{
    
    self.titleLabel.text = cellModel.noti_Name;
    self.iconView.image = KImageNamed(cellModel.noti_icon);
    
    self.numberLabel.hidden = cellModel.count ? NO : YES;
    self.numberLabel.text = checkInteger(cellModel.count);
    self.accessoryType = cellModel.count ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
    
    [self layoutIfNeeded];
}

-(void)layoutSectionHeader{
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(15);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(KScreenWidth - 85);
    }];
    
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(self).offset(-0.5);
        make.width.mas_equalTo(KScreenWidth);
        make.height.equalTo(@0.5);
    }];
}


- (UIView *)sepLine {
    if (!_sepLine) {
        _sepLine = [[UIView alloc] init];
        _sepLine.backgroundColor = KLine_Color;
    }
    return _sepLine;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = KFont(16);
        _titleLabel.textColor = KTitle_Color;
    }
    return _titleLabel;
}
-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel labelWithFrame:CGRectMake(0, 0, 15, 15) title:@"" titleColor:KWhite_Color fontSize:12];
        _numberLabel.backgroundColor = KDebug_Color;
        _numberLabel.clipsToBounds = YES;
        _numberLabel.layer.cornerRadius = 7.5;
    }
    return _numberLabel;
}


@end





