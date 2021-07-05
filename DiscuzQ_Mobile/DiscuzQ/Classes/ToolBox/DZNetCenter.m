//
//  DZNetCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"

@interface DZNetCenter ()

@property (nonatomic, assign) NSInteger sdkVersion;

@end

@implementation DZNetCenter

+ (instancetype)center {
    static DZNetCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[DZNetCenter alloc] init];
    });
    return center;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setSdkVersion:DZQ_SDKVersion];
        _formatter = [DZNetFormatter shared];
    }
    return self;
}


-(void)setSdkVersion:(NSInteger)sdkVersion{
    _sdkVersion = sdkVersion;
    [[DZQNetTool shared] updateSDKVersion:sdkVersion];
}

-(void)updateNetSDkToken:(DZQTokenV1 *)tokenModel{
    [[DZQNetTool shared] updateDZQSDKToken:tokenModel];
}

/*
 *  清除缓存信息
 */
- (void)cleanNetSDKCacheWithCompletion:(void (^)(void))completion{
    [[DZQNetTool shared] cleanUplogicCacheWithCompletion:completion];
}


-(void)dz_checkApiVersionWithCompletion:(void (^)( NSInteger version))completion{
    
    
    
}

/// 退出登录
-(void)dzx_loginOutWithCompletion:(void (^)(void))completion{
    
    [[DZQNetTool shared] DZQ_LoginOutWithCompletion:^{
        if (completion) {
            completion();
        }
    }];
}


@end
