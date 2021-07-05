//
//  DZThreadAUser.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  显示点赞 付费 或者 打赏的 用户列表

#import "DZThreadAUser.h"
#import "UILabel+TopTitle.h"
#import "DZAUserListBar.h"

@interface DZThreadAUser ()

@property (nonatomic, strong) DZAUserListBar *likeBar;  //!< 点赞用户
@property (nonatomic, strong) DZAUserListBar *paidBar;  //!< 支付用户
@property (nonatomic, strong) DZAUserListBar *rewardBar;  //!< 打赏

@end

@implementation DZThreadAUser

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_DZThreadAUser];
    }
    return self;
}

-(void)config_DZThreadAUser{
    [self addSubview:self.rewardBar];
    [self addSubview:self.likeBar];
    [self addSubview:self.paidBar];
}

- (void)updateThreadAUser:(DZQDataThread *)Model{
    
}

-(void)layoutAUserSubview{
    
}


//-(UILabel *)mainTitleLabel{
//    if (!_mainTitleLabel) {
//        _mainTitleLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KColor(K2A2C2F_Color, 1.0) font:KBoldFont(16) textAlignment:NSTextAlignmentLeft];
//        _mainTitleLabel.numberOfLines = 1;
//    }
//    return _mainTitleLabel;
//}


@end
