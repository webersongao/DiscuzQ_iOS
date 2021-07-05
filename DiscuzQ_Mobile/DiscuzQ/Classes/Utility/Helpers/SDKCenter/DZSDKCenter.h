//
//  DZSDKCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/11/28.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZSDKCenter : NSObject

// 单例
+ (nonnull instancetype)Shared;

/*
 *  设置参数
 */
- (void)initUMengSDKConfigure;

+(void)initWithShareConfig;

@end
