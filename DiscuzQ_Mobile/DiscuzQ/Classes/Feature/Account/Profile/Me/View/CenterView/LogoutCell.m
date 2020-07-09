//
//  LogoutCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "LogoutCell.h"

@interface LogoutCell ()

@property (nonatomic, strong) UILabel *lab;

@end

@implementation LogoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView {
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.lab = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth / 2 - 100, 5, 200, 50)];
    self.lab.backgroundColor = KWhite_Color;
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.font = KFont(17);
    self.lab.textColor = KGray_Color;
    
    self.lab.text = @"退出登录";
    [self.contentView addSubview:self.lab];
}


-(void)updateLogoutCell:(NSString *)text{
    self.lab.text = text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lab.frame = CGRectMake(15, 5, KScreenWidth - 30, 50);
    [self setRadius:self.lab];
}

- (void)setRadius:(UILabel *)lab {
    lab.layer.borderColor = KLine_Color.CGColor;
    lab.layer.borderWidth = 0.5;
    lab.layer.masksToBounds = YES;
    lab.layer.cornerRadius = 8;
}

@end
