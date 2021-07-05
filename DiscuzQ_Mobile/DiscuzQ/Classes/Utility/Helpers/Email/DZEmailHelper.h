//
//  DZEmailHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/4/8.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZEmailHelper : NSObject

+ (instancetype)Helper;

// 默认 发 开发者邮箱
- (void)prepareToSendEmail:(NSString *)emailStr;


@end





