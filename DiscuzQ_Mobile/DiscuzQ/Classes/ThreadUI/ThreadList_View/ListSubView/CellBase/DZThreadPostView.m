//
//  DZThreadPostView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadPostView.h"
#import "DZThreadAUser.h"
#import "DZThreadAComment.h"

@interface DZThreadPostView ()

@property (nonatomic, strong) DZThreadAUser *likeView;  //!< 点赞用户
@property (nonatomic, strong) DZThreadAUser *paidView;  //!< 属性注释
@property (nonatomic, strong) DZThreadAUser *rewardView;  //!< 打赏用户

@property (nonatomic, strong) DZThreadAComment *commentView;  //!< 最新三条评论
@property (nonatomic, strong) UIButton *moreButton;  //!< 查看更多100条评论

@end

@implementation DZThreadPostView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config_ThreadPostView];
    }
    return self;
}

-(void)config_ThreadPostView{
    
}

- (void)updateThreadPostView:(DZQDataThread *)Model{
    
    
}

-(DZThreadAUser *)likeView{
    if (!_likeView) {
        _likeView = [[DZThreadAUser alloc] initWithFrame:CGRectZero];
    }
    return _likeView;
}

-(DZThreadAUser *)paidView{
    if (!_paidView) {
        _paidView = [[DZThreadAUser alloc] initWithFrame:CGRectZero];
    }
    return _paidView;
}

-(DZThreadAUser *)rewardView{
    if (!_rewardView) {
        _rewardView = [[DZThreadAUser alloc] initWithFrame:CGRectZero];
    }
    return _rewardView;
}

-(DZThreadAComment *)commentView{
    if (!_commentView) {
        _commentView = [[DZThreadAComment alloc] initWithFrame:CGRectZero];
    }
    return _commentView;
}

- (UIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"noavatar_small" touchImgPath:@"noavatar_small" isBackImage:YES picAlpha:1];
    }
    return _moreButton;
}


@end
