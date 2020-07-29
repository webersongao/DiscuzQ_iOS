//
//  DZSearchListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/11.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZSearchListCell.h"
#import "SearchModel.h"

@implementation DZSearchListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.evaluateLabel];
    
    self.contentLabel.numberOfLines = 3;
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.width.mas_equalTo(KScreenWidth - 20);
    }];
    
    CGFloat textW = (KScreenWidth - 30) / 2;
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(textW);
    }];
    
    [self.evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right).offset(10);
        make.top.equalTo(self.timeLabel);
        make.width.equalTo(self.timeLabel);
    }];
}

-(void)updateSearchCell:(SearchModel *)cellModel {
    _info = cellModel;
    NSRange range = [cellModel.subject rangeOfString:cellModel.keyword];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:cellModel.subject];
    [str addAttribute:NSForegroundColorAttributeName value:KGreen_Color range:range];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:range];
    self.contentLabel.attributedText = str;
    self.timeLabel.text = cellModel.dateline;
    self.evaluateLabel.text = [NSString stringWithFormat:@"%ld个评论",(long)cellModel.replies];
}
- (CGFloat)caculateSearchCellHeight:(SearchModel *)info {
    [self updateSearchCell:info];
    [self layoutIfNeeded];
    return [self cellHeight];
}

- (CGFloat)cellHeight {
    return CGRectGetMaxY(self.timeLabel.frame) + 10;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = KFont(18);
    }
    return _contentLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = KFont(14);
        _timeLabel.textColor = KGray_Color;
    }
    return  _timeLabel;
}

- (UILabel *)evaluateLabel {
    if (_evaluateLabel == nil) {
        _evaluateLabel = [[UILabel alloc] init];
        _evaluateLabel.font = KFont(14);
        _evaluateLabel.textColor = KGray_Color;
    }
    return _evaluateLabel;
}

@end
