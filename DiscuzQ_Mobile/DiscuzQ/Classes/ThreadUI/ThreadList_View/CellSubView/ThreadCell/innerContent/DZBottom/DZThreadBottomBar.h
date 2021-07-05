//
//  DZThreadBottomBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDListStyle.h"

@interface DZThreadBottomBar : UIView

@property (nonatomic, strong) UIButton *leftButton;  //!< 点赞数
@property (nonatomic, strong) UIButton *centerButton;  //!< 回复数
@property (nonatomic, strong) UIButton *rightButton;  //!< 分享
@property (nonatomic, strong) UIView *bottomLine;  //!< 分割线

-(void)updateBottombar:(DZQDataThread *)dataThread Layout:(DZDToolBarStyle *)modelLayout;

-(void)configToolBarAction:(id)target left:(SEL)likeSel center:(SEL)replySel right:(SEL)shareSel;


@end


