//
//  DZWalletCashListCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZWalletCashListCell.h"

@interface DZWalletCashListCell ()

@property (nonatomic, strong) UILabel *logTypeLabel;  //!< 变动 类型

@property (nonatomic, strong) UILabel *availableLabel;  //!< 变动 数值
@property (nonatomic, strong) UILabel *freezeLabel;  //!< 冻结 数值
@property (nonatomic, strong) UILabel *availableDescLabel;  //!< 描述

@property (nonatomic, strong) UILabel *timeLabel;  //!< 时间
@property (nonatomic, strong) UILabel *orderSnLabel;  //!< 订单号


@end

@implementation DZWalletCashListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_CashListCell];
    }
    return self;
}


-(void)config_CashListCell{
    
    [self addSubview:self.logTypeLabel];
    [self addSubview:self.availableLabel];
    [self addSubview:self.freezeLabel];
    [self addSubview:self.availableDescLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.orderSnLabel];
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)updateWalletCashListCell:(DZQDataCashLog *)Model IndexPath:(NSIndexPath *)indexPath {
    
    self.availableLabel.text = checkFloat(Model.attributes.change_available_amount);
    self.freezeLabel.text = checkFloat(Model.attributes.change_freeze_amount);
    self.orderSnLabel.text = Model.relationships.order.attributes.order_sn;
    self.availableDescLabel.text = Model.attributes.change_desc;
    self.timeLabel.text = Model.attributes.created_at;
    
    DZCashLogStyle *style = (DZCashLogStyle *)Model.styleModel;
    self.logTypeLabel.text = style.localChange_Type;
    
    [self layoutSubview:style];
}



-(void)layoutSubview:(DZCashLogStyle *)style{
    
    self.logTypeLabel.frame = style.kf_cashlog_type;
    self.availableLabel.frame = style.kf_cashlog_available;
    self.freezeLabel.frame = style.kf_cashlog_freeze;
    
    self.availableDescLabel.frame = style.kf_cashlog_availableDesc;
    self.timeLabel.frame = style.kf_cashlog_time;
    self.orderSnLabel.frame = style.kf_cashlog_orderSn;
    
}

-(UILabel *)logTypeLabel{
    if (!_logTypeLabel) {
        _logTypeLabel = [UILabel labelWithFrame:CGRectZero title:@"00.00" titleColor:KWhite_Color font:KFont(15.f) textAlignment:NSTextAlignmentCenter];
        _logTypeLabel.numberOfLines = 0;
        [_logTypeLabel sizeThatFits:CGSizeMake(35, 40)];
        _logTypeLabel.backgroundColor = KRandom_Color;
        _logTypeLabel.layer.cornerRadius = 5;
        _logTypeLabel.layer.masksToBounds = YES;
    }
    return _logTypeLabel;
}

-(UILabel *)availableLabel{
    if (!_availableLabel) {
        _availableLabel = [UILabel labelWithFrame:CGRectZero title:@"00.00" titleColor:KTitle_Color font:KBoldFont(18.f) textAlignment:NSTextAlignmentLeft];
    }
    return _availableLabel;
}

-(UILabel *)freezeLabel{
    if (!_freezeLabel) {
//        _freezeLabel = [UILabel labelWithFrame:CGRectMake(self.availableLabel.left, self.iconView.top+kMargin20, (KScreenWidth-100)/4.0, kMargin20) title:@"00.00" titleColor:KLightContent_Color font:KBoldFont(14.f) textAlignment:NSTextAlignmentCenter];
    }
    return _freezeLabel;
}

-(UILabel *)availableDescLabel{
    if (!_availableDescLabel) {
        _availableDescLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KLightContent_Color font:KFont(12.f) textAlignment:NSTextAlignmentLeft];
    }
    return _availableDescLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFrame:CGRectZero title:@"0.00" titleColor:KLightContent_Color font:KFont(12.f) textAlignment:NSTextAlignmentRight];
    }
    return _timeLabel;
}

-(UILabel *)orderSnLabel{
    if (!_orderSnLabel) {
        _orderSnLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KLightContent_Color font:KFont(12.f) textAlignment:NSTextAlignmentRight];
    }
    return _orderSnLabel;
}



@end
