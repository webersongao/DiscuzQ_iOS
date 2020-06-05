//
//  DZLoginModule.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/7.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZLoginModule.h"
#import "DZPushCenter.h"
#import "DZShareCenter.h"

NSString * const CookieValue = @"COOKIEVALU";

@implementation DZLoginModule

/*
 * 判断是否登录
 */
+ (BOOL)isLogged {
    NSString *uid = [DZMobileCtrl sharedCtrl].User.user_id;
    NSString *auth = [DZMobileCtrl sharedCtrl].User.access_token;
    if (uid.length && auth.length) {
        return YES;
    }
    return NO;
}

/*
 * 退出登录
 */
+ (void)signoutWithCompletion:(void (^)(void))completion {
    //  LoginFile
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:CookieValue];
    [[DZPushCenter shareInstance] configPush];
    [[DZLocalContext shared] removeLocalUserData];
    [DZMobileCtrl sharedCtrl].User = nil;
    for (NSHTTPCookie *cookie in [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    [[DZNetCenter center] dzx_loginOutWithCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

/*
 * 设置自动登录状态
 */

+ (void)localUserAutoLogin {
    //    DZUserModel *user = [[DZLocalContext shared] GetLocalUser];
    
}

+ (BOOL)checkLoginName:(NSString *)userName Pwd:(NSString *)password{
    
    if (![DataCheck isValidString:userName]) {
        [MBProgressHUD showInfo:@"请输入用户名"];
        return NO;
    }
    if (![DataCheck isValidString:password]) {
        [MBProgressHUD showInfo:@"请输入密码"];
        return NO;
    }
    
    return YES;
}


// 普通登录或者登录成功  保存数据
+ (void)saveLoginUserData:(NSDictionary *)dataDict andHandle:(void(^)(void))handle{
    
    DZQDataModel *dataModel = [DZQDataModel yy_modelWithDictionary:dataDict];
    // 转成 本地使用模型
    DZUserModel *localModel = [DZUserModel configUserModel:[dataModel.relationships dictionaryForKey:@"users"] token:dataModel.attributes];
    // 保存 更新数据
    [DZMobileCtrl sharedCtrl].User = localModel;
    [[DZLocalContext shared] updateLocalUser:localModel];
    
    // 执行回调
    handle?handle():nil;
}



@end

