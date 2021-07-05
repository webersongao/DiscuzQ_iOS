//
//  UIControl+DelayEnable.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (DelayEnable) // 分类category原本不支持添加属性（只会有对应的getter、setter方法，不生成成员变量，访问还会报错，必须实现）。  实现里面通过runtime添加
@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval; // 重复点击的间隔
//@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;
@end
NS_ASSUME_NONNULL_END
