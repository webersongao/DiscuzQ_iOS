//
//  DZThreadDetailSection.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailSection.h"
#import "DZAUserListBar.h"

@interface DZThreadDetailSection ()

@property (nonatomic, strong) UIView *sepLine;  //!< 顶部10px分割线
@property (nonatomic, strong) UIView *bottoLine;  //!< 底部分割线
@property (nonatomic, strong) DZAUserListBar *likeUserBar;  //!< 点赞用户列表
@property (nonatomic, strong) DZAUserListBar *rewardUserBar;  //!< 打赏用户列表

@end

@implementation DZThreadDetailSection

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
       [self config_DetailSection];
        self.backgroundColor = KRandom_Color;
    }
    return self;
}


-(void)config_DetailSection{
    
    [self.contentView addSubview:self.sepLine];
    [self.contentView addSubview:self.likeUserBar];
    [self.contentView addSubview:self.rewardUserBar];
    [self.contentView addSubview:self.bottoLine];
    
}


-(void)updateSectionLike:(NSArray<DZQDataUser *> *)likedUser reward:(NSArray<DZQDataUser *> *)rewardUser layout:(DZDSectionStyle *)layout{
  
    [self.likeUserBar updateAUserListBar:likedUser name:@"点赞"];
    [self.rewardUserBar updateAUserListBar:rewardUser name:@"打赏"];
    
    [self layoutThreadDetailSection:layout];
}


-(void)layoutThreadDetailSection:(DZDSectionStyle *)layout{
    
    self.sepLine.frame = layout.kf_Line;
    self.likeUserBar.frame = layout.kf_listOne;
    self.rewardUserBar.frame = layout.kf_listTwo;
    self.bottoLine.frame = layout.kf_bottomLine;
}


-(UIView *)sepLine{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] initWithFrame:CGRectZero];
        _sepLine.backgroundColor = KLine_Color;
    }
    return _sepLine;
}

-(DZAUserListBar *)likeUserBar{
    if (!_likeUserBar) {
        _likeUserBar = [[DZAUserListBar alloc] initWithFrame:CGRectZero];
    }
    return _likeUserBar;
}

-(DZAUserListBar *)rewardUserBar{
    if (!_rewardUserBar) {
        _rewardUserBar = [[DZAUserListBar alloc] initWithFrame:CGRectZero];
    }
    return _rewardUserBar;
}

-(UIView *)bottoLine{
    if (!_bottoLine) {
        _bottoLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottoLine.backgroundColor = KLine_Color;
    }
    return _bottoLine;
}


@end
