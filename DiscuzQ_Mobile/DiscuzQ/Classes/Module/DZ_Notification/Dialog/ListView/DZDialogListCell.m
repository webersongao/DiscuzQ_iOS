//
//  DZDialogListCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDialogListCell.h"
#import "DZDiaLogStyle.h"
#import "DZHtmlLabel.h"

@interface DZDialogListCell ()

@property (nonatomic, strong) UIView *sepLine;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) DZHtmlLabel *detailLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel * numberLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation DZDialogListCell


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
    [self addSubview:self.detailLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.numberLabel];
    self.backgroundColor = KWhite_Color;
}


- (void)updateMessageListCell:(DZQDataDialog *)cellModel{

    
    self.titleLabel.text = cellModel.relationships.recipient.attributes.username;
    [self.detailLabel updateContent_Html:((DZDiaLogStyle *)cellModel.styleModel).kf_diaContentItem];
    self.timeLabel.text = ((DZDiaLogStyle *)cellModel.styleModel).kf_timeString;
    [self.iconView dz_setImageWithURL:cellModel.relationships.recipient.attributes.avatarUrl placeholder:KImageNamed(DZQ_icon)];
    
    //    self.numberLabel.hidden = cellModel.count ? NO : YES;
    //    self.numberLabel.text = checkIntegerStr(cellModel.count);
    //    self.accessoryType = cellModel.count ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
    
    [self layoutDialogSectionCell:(DZDiaLogStyle *)cellModel.styleModel];
}

-(void)layoutDialogSectionCell:(DZDiaLogStyle *)style{
    
    self.iconView.frame = style.kf_icon;
    self.titleLabel.frame = style.kf_title;
    self.detailLabel.frame = style.kf_content;
    self.timeLabel.frame = style.kf_time;
    self.numberLabel.frame = style.kf_number;
    self.sepLine.frame = style.kf_bottomLine;
    self.iconView.layer.cornerRadius = style.kf_icon.size.height/2.0;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.clipsToBounds = YES;
    }
    return _iconView;
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
        _titleLabel.font = KBoldFont(16);
        _titleLabel.textColor = KTitle_Color;
    }
    return _titleLabel;
}

- (DZHtmlLabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
//        _detailLabel.font = KFont(14);
//        _detailLabel.textColor = KContent_Color;
    }
    return _detailLabel;
}

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = KFont(12.f);
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = KColor(K9A9AA7_Color, 1.0);
    }
    return _timeLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel labelWithFrame:CGRectMake(0, 0, 15, 15) title:@"" titleColor:KWhite_Color fontSize:12];
        _numberLabel.hidden = YES;
        _numberLabel.clipsToBounds = YES;
        _numberLabel.layer.cornerRadius = 7.5;
        _numberLabel.backgroundColor = KRed_Color;
    }
    return _numberLabel;
}


@end





