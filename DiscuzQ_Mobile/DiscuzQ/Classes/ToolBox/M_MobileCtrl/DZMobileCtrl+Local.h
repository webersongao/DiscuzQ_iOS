//
//  DZMobileCtrl+Local.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/27.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

extern NSString * const DZ_BoolThemeMode;

@interface DZMobileCtrl (Local)

/**
 夜间模式
 @return yes 夜间模式  no 正常
 */
- (BOOL)isNightMode;

#pragma mark - 清除缓存
-(void)cleanLocalDataCache:(void(^)(void))compltaion;

@end


