//
//  DZDevice.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/7/12.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZDevice : NSObject


+ (NSString *)getIconName;

/**
 获取手机当前语言
 @return 语言种类
 */
+ (NSString*)getPreferredLanguage;

@end
