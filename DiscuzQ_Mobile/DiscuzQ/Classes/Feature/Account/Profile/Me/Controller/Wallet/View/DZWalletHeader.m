//
//  DZWalletHeader.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZWalletHeader.h"

@interface DZWalletHeader ()


@property (nonatomic, strong) UIImageView *iconView;  //!< 余额

@property (nonatomic, strong) UILabel *availableLab;  //!< 余额
@property (nonatomic, strong) UILabel *freezeLab;  //!< 余额
@property (nonatomic, strong) UILabel *availableLabel;  //!< 余额 数值
@property (nonatomic, strong) UILabel *freezeLabel;  //!< 冻结 数值
@property (nonatomic, strong) UILabel *taxRatioLab;  //!< 费率
@property (nonatomic, strong) UILabel *taxRatioLabel;  //!< 费率 数值

@property (nonatomic, strong) UILabel *statusLabel;  //!< 状态

@property (nonatomic, strong) UIView *sectionView;  //!< 状态
@property (nonatomic, strong) UILabel *leftDescLabel;  //!< 解释说明性文字
@property (nonatomic, strong) UIButton *rightFilterButton;  //!< 筛选按钮

@end

@implementation DZWalletHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_WalletHeaderView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_WalletHeaderView{
    
    [self addSubview:self.iconView];
    [self addSubview:self.availableLabel];
    [self addSubview:self.availableLab];
    [self addSubview:self.freezeLabel];
    [self addSubview:self.freezeLab];
    [self addSubview:self.taxRatioLabel];
    [self addSubview:self.taxRatioLab];
    [self addSubview:self.statusLabel];
    
    [self addSubview:self.sectionView];
    [self.sectionView addSubview:self.leftDescLabel];
    [self.sectionView addSubview:self.rightFilterButton];
    
}



-(void)updateWalletHeader:(DZQDataWallet *)dataModel{
    
    self.statusLabel.text = (dataModel.attributes.wallet_status == 0) ? @"正常" : @"已冻结";
    
    self.availableLabel.text = checkFloat(dataModel.attributes.available_amount);
    self.freezeLabel.text = checkFloat(dataModel.attributes.freeze_amount);
    self.taxRatioLabel.text = checkFloat(dataModel.attributes.cash_tax_ratio);
    
    [self.iconView dz_setImageWithURL:dataModel.relationships.user.attributes.avatarUrl placeholder:KImageNamed(DZQ_icon)];
    
}








-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin15, kMargin10, kCellHeight_60, kCellHeight_60)];
        _iconView.image = KImageNamed(DZQ_icon);
        _iconView.layer.cornerRadius = 10.f;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

-(UILabel *)availableLabel{
    if (!_availableLabel) {
        _availableLabel = [UILabel labelWithFrame:CGRectMake(self.iconView.right + kMargin45, self.iconView.top+kMargin10, (self.width-100)/2.0-kMargin35, kMargin40) title:@"00.00" titleColor:KTitle_Color font:KBoldFont(35.f) textAlignment:NSTextAlignmentLeft];
    }
    return _availableLabel;
}


-(UILabel *)availableLab{
    if (!_availableLab) {
        _availableLab = [UILabel labelWithFrame:CGRectMake(self.iconView.right + kMargin10, self.iconView.bottom-kMargin20, kMargin35, kMargin15) title:@"余额:" titleColor:KLightContent_Color font:KFont(12.f) textAlignment:NSTextAlignmentLeft];
    }
    return _availableLab;
}


-(UILabel *)freezeLabel{
    if (!_freezeLabel) {
        _freezeLabel = [UILabel labelWithFrame:CGRectMake(self.availableLabel.right, self.iconView.top+kMargin20, (self.width-100)/4.0, kMargin20) title:@"00.00" titleColor:KLightContent_Color font:KBoldFont(14.f) textAlignment:NSTextAlignmentCenter];
    }
    return _freezeLabel;
}

-(UILabel *)freezeLab{
    if (!_freezeLab) {
        _freezeLab = [UILabel labelWithFrame:CGRectMake(self.freezeLabel.left, self.freezeLabel.bottom+kMargin5, self.freezeLabel.width, kMargin15)  title:@"冻结金额" titleColor:KLightContent_Color font:KFont(14.f) textAlignment:NSTextAlignmentCenter];
    }
    return _freezeLab;
}

-(UILabel *)taxRatioLabel{
    if (!_taxRatioLabel) {
        _taxRatioLabel = [UILabel labelWithFrame:CGRectMake(self.freezeLabel.right, self.iconView.top+kMargin20, self.freezeLabel.width, kMargin20) title:@"0.00" titleColor:KLightContent_Color font:KFont(14.f) textAlignment:NSTextAlignmentCenter];
        
        _taxRatioLabel.contentMode = UIControlContentVerticalAlignmentBottom;
    }
    return _taxRatioLabel;
}

-(UILabel *)taxRatioLab{
    if (!_taxRatioLab) {
        _taxRatioLab = [UILabel labelWithFrame:CGRectMake(self.freezeLabel.right, self.taxRatioLabel.bottom+kMargin5, self.freezeLabel.width, kMargin15) title:@"提现税率" titleColor:KLightContent_Color font:KFont(14.f) textAlignment:NSTextAlignmentCenter];
    }
    return _taxRatioLab;
}


// 钱包状态 正常 or 冻结提现
-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = [UILabel labelWithFrame:CGRectMake(self.right-kMargin45-kMargin15, self.iconView.top, kMargin45, kMargin15) title:@"未知" titleColor:KLightContent_Color font:KFont(12.f) textAlignment:NSTextAlignmentCenter];
        _statusLabel.backgroundColor = KLine_Color;
        _statusLabel.layer.cornerRadius = 2.f;
        _statusLabel.layer.masksToBounds = YES;
    }
    return _statusLabel;
}


-(UIView *)sectionView{
    if (!_sectionView) {
        _sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, self.iconView.bottom+kMargin10, self.width, kMargin40)];
        _sectionView.backgroundColor = KLine_Color;
    }
    return _sectionView;
}

-(UILabel *)leftDescLabel{
    if (!_leftDescLabel) {
        _leftDescLabel = [UILabel labelWithFrame:CGRectMake(kMargin15, 0, self.width*0.7, kMargin40) title:@"钱包动账记录:" titleColor:KContent_Color font:KFont(14.f) textAlignment:NSTextAlignmentLeft];
    }
    return _leftDescLabel;
}


-(UIButton *)rightFilterButton{
    if (!_rightFilterButton) {
        _rightFilterButton = [UIButton ButtonTextWithFrame:CGRectMake(self.right - kMargin15 - 80, 0, 80, kMargin40) titleStr:@"筛选项↕" titleColor:KContent_Color titleTouColor:KContent_Color font:KBoldFont(16) Radius:4.f Target:self action:nil];
        _rightFilterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _rightFilterButton;
}


@end
