//
//  DZBaseTableViewCell.m
//  DiscuzQ
//
//  Created by Haoren on 2019/5/13.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@implementation DZBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_BaseListeCell];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)config_BaseListeCell {
    self.textLabel.font = KBoldFont(14);
    self.backgroundColor = KDebug_Color;
    self.detailTextLabel.font = KFont(12);
    self.textLabel.textColor = KTitle_Color;
    [self.contentView addSubview:self.seprateLine];
    self.detailTextLabel.textColor = KContent_Color;
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = KLightGray_Color;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.seprateLine.frame = CGRectMake(kMargin10, self.height-0.5, self.width - kMargin20, 0.5);
}


- (UIView *)seprateLine{
    if (!_seprateLine) {
        _seprateLine = [[UIView alloc] initWithFrame:CGRectZero];
        _seprateLine.backgroundColor = KLine_Color;
    }
    return _seprateLine;
}

@end
