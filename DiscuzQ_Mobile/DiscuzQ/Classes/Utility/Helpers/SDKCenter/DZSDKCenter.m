//
//  DZSDKCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/11/28.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//  https://developer.umeng.com/docs/128606/detail/193653

#import "DZSDKCenter.h"
//#import <UMShare/UMShare.h>
//#import <UMCommon/UMCommon.h>

@implementation DZSDKCenter
// 单例
+ (instancetype)Shared {
    static DZSDKCenter *share = nil;
    static dispatch_once_t OnceToken;
    dispatch_once(&OnceToken, ^{
        share = [[DZSDKCenter alloc] init];
    });
    return share;
}
// 参数配置
- (void)initUMengSDKConfigure {

//    [UMConfigure initWithAppkey:DZ_UMeng_AppKey channel:nil];
    
}




+(void)initWithShareConfig{
    
    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:DZ_WX_APPID appSecret:DZ_WX_APPSECRET redirectURL:DZ_QQ_UniLink];
//
//    /*设置小程序回调app的回调*/
//    [[UMSocialManager defaultManager] setLauchFromPlatform:(UMSocialPlatformType_WechatSession) completion:^(id userInfoResponse,NSError*error){
//        NSLog(@"setLauchFromPlatform:userInfoResponse:%@",userInfoResponse);
//    }];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:DZ_QQ_APPID  appSecret:nil redirectURL:DZ_QQ_UniLink];
//    
//    /* 设置新浪的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:DZ_WB_APPID  appSecret:DZ_WB_APPSECRET redirectURL:DZ_WB_REDIRRCTURI];
    
}






@end
