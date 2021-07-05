//
//  DZThreadAComment.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  显示三条评论

#import "DZThreadAComment.h"
#import "DZAPostComment.h"
#import "DZThreadAUser.h"

@interface DZThreadAComment ()

@property (nonatomic, strong) UIButton *bottomBar;  //!< 昵称
@property (nonatomic, strong) DZAPostComment *commentView;  //!< 昵称

@end

@implementation DZThreadAComment

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.commentView];
        [self addSubview:self.bottomBar];
    }
    return self;
}


- (void)updateThreadComment:(DZQDataThread *)Model{
    
}

-(void)layoutACommentSubview{
    
}


-(DZAPostComment *)commentView{
    if (!_commentView) {
        _commentView = [[DZAPostComment alloc] initWithFrame:CGRectZero];
    }
    return _commentView;
}

-(UIButton *)bottomBar{
    if (!_bottomBar) {
        _bottomBar = [UIButton ButtonTextWithFrame:CGRectMake(0, 0, 0, 0) titleStr:@"" titleColor:KGreen_Color titleTouColor:KGreen_Color font:KFont(16.f) Radius:0 Target:self action:nil];
    }
    return _bottomBar;
}

@end
