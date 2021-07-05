//
//  DZSDKCenter+Login.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSDKCenter+Login.h"

@implementation DZSDKCenter (Login)


#pragma mark - qq登录
- (void)loginWithQQSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish {
    
    //    if ([ShareSDK hasAuthorized:SSDKPlatformTypeQQ]) { // 由于qq登录需要切换账号
    //        [ShareSDK cancelAuthorize:SSDKPlatformTypeQQ result:nil];
    //    }
    //
    //    [self loginWithPlatform:SSDKPlatformTypeQQ success:success finish:finish];
    
}

#pragma mark - 微信登录finish
- (void)loginWithWeiXinSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish {
    // 去授权登录
//    [self loginWithPlatform:SSDKPlatformTypeWechat success:success finish:finish];;
    
}


#pragma mark - qq登录
//- (void)loginWithPlatform:(SSDKPlatformType)platformType success:(void(^)(id postData, id getData))success finish:(void(^)(void))finish {
//
//    [ShareSDK getUserInfo:platformType
//           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
//               dispatch_async(dispatch_get_main_queue(), ^{
//                   finish?finish():nil;
//                   if (state == SSDKResponseStateSuccess) {
//                       // 汉字GBK编码
//                       NSString *dataGBK = [user.nickname utf2gbk];
//                       NSString *type = @"qq";
//                       if (platformType == SSDKPlatformTypeWechat) {
//                           type = @"weixin";
//                       }
//                       if (user.uid.length) {
//                           NSMutableDictionary *dic = @{@"openid":user.uid,
////                                                        @"type":type,
////                                                        @"username":user.nickname
//                                                        }.mutableCopy;
//                           if ([type isEqualToString:@"weixin"]) {
//                               if ([user.rawData stringForKey:@"unionid"].length) {
//                                   [dic setValue:[user.rawData stringForKey:@"unionid"] forKey:@"unionid"];
//                               }
//                           }
//                           success?success(dic,@{@"type":type}):nil;
//                       } else {
//                           [MBProgressHUD showInfo:@"服务器繁忙请重试"];
//                       }
//                   }else if (state == SSDKResponseStateCancel) {
//                       [MBProgressHUD showInfo:@"取消授权"];
//                   }else if (state == SSDKResponseStateFail) {
//                       [MBProgressHUD showInfo:@"授权失败"];
//                   }else {
//                       [MBProgressHUD showInfo:error.description];
//                   }
//               });
//           }];
//}




@end
