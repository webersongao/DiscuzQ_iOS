//
//  DZThreadBottomBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDListStyle.h"

@interface DZThreadBottomBar : UIView

@property (nonatomic, strong) UIButton *likeButton;  //!< 点赞数
@property (nonatomic, strong) UIButton *replyButton;  //!< 回复数
@property (nonatomic, strong) UIButton *shareButton;  //!< 浏览数
@property (nonatomic, strong) UIView *bottomLine;  //!< 分割线

-(void)updateBottombarLayout:(DZDToolBarStyle *)modelLayout;

-(void)configToolBarAction:(id)target like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel;


@end


