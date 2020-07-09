// 放头像，用户名，身份
//  DZOtherUserHeader.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZOtherUserHeader.h"

@interface DZOtherUserHeader ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *groupLabel;
@property (nonatomic, strong) UIImageView *headView;

@end

@implementation DZOtherUserHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_userHeader];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

- (void)config_userHeader {
    
    [self addSubview:self.headView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.groupLabel];
    
    [self addSubview:[DZViewHelper lineView:CGRectMake(0, self.height-kMargin5, self.width, kMargin5)]];
}

-(void)updateInfoHeader:(NSString *)userName grade:(NSString *)grade icon:(NSString *)iconName{
   
    self.nameLabel.text = checkNull(userName);
    self.groupLabel.text = checkNull(grade);
    [self.groupLabel sizeToFit];
    self.groupLabel.centerX = self.nameLabel.centerX;
    [self.headView dz_setOptionImageWithURL:iconName placeholder:KImageNamed(@"noavatar_small") options:YYWebImageOptionRefreshImageCache];
}


- (UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 32, 10, 64, 64)];
        _headView.layer.masksToBounds = YES;
        _headView.image = [UIImage imageNamed:@"noavatar_small"];
        _headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _headView.layer.cornerRadius = CGRectGetWidth(self.headView.frame) / 2.0;
    }
    return _headView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectMake(self.width/2.0 - 100, self.height/2.0 + 5, 200, 25) title:@"---" titleColor:KTitle_Color fontSize:17.f];
    }
    return _nameLabel;
}

-(UILabel *)groupLabel{
    if (!_groupLabel) {
        _groupLabel = [UILabel labelWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom + kMargin10, self.nameLabel.width, 18) title:@"新手上路" titleColor:KWhite_Color fontSize:13.f];
        _groupLabel.textAlignment = NSTextAlignmentCenter;
        _groupLabel.backgroundColor = KGreen_Color;
        _groupLabel.layer.masksToBounds = YES;
        _groupLabel.layer.cornerRadius = 2;
    }
    return _groupLabel;
}

@end
