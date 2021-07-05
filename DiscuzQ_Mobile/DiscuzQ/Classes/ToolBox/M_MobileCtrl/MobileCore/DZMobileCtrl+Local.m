//
//  DZMobileCtrl+Local.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/27.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Local.h"
#import "DZCacheHelper.h"

NSString * const DZ_BoolThemeMode = @"dz_Nosfs2Mode";

@implementation DZMobileCtrl (Local)

/**
 夜间模式
 @return yes 夜间模式  no 正常
 */
- (BOOL)isNightMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:DZ_BoolThemeMode];
}


-(void)cleanLocalDataCache:(void(^)(void))compltaion {
    
    KBack_ThreadBlock(^{
        NSString *cachPath = [DZFileManager Shared].dz_CachesPath;
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        for (NSString *p in files) {
            NSError * error;
            NSString * path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        
        // 清除SD 缓存
        
        [[DZNetCenter center] cleanNetSDKCacheWithCompletion:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (compltaion) {
                compltaion();
            }
        });
    });
    
}


@end






