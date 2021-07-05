//
//  DZUserLoginView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/10.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZAccountScrollView.h"

@interface DZUserLoginView : DZAccountScrollView


-(instancetype)initWithFrame:(CGRect)frame isQQ:(BOOL)isQQ isWx:(BOOL)isWx;


-(void)configTarget:(id)target WxLogin:(SEL)wxLogin QQ:(SEL)QQLogin apple:(SEL)appleLogin;



@end
