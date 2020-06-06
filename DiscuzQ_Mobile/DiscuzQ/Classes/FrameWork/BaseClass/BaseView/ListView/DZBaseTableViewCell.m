//
//  DZBaseTableViewCell.m
//  DiscuzQ
//
//  Created by Haoren on 2019/5/13.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@implementation DZBaseTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = KRandom_Color;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_BaseListeCell];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)config_BaseListeCell {
    [self.contentView addSubview:self.seprateLine];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = KColor(@"#F7F7F8", 1);
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
