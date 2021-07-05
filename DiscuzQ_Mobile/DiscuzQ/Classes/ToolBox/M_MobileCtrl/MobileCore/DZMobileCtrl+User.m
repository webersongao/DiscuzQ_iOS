//
//  DZMobileCtrl+User.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+User.h"
#import "DZPushCenter.h"

NSString * const CookieValue = @"COOKIEVALU";


@implementation DZMobileCtrl (User)


/*
 * 退出登录
 */
- (void)signoutWithCompletion:(void (^)(void))completion {
    //  LoginFile
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:CookieValue];
    [[DZPushCenter Shared] configPush];
    [[DZMobileCtrl sharedCtrl] updateRootUser:nil];
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

- (void)localUserAutoLogin {
    //    DZUserM *user = [[DZDataContext shared] GetLocalUser];
    
}

- (BOOL)checkLoginName:(NSString *)userName Pwd:(NSString *)password{
    
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
- (void)saveLoginUserData:(NSDictionary *)dataDict andHandle:(void(^)(void))handle{
    
    DZQDataV1 *dataModel = [DZQDataV1 DZQ_ModelWithDictionary:dataDict];
    // 转成 本地使用模型
    DZUserM *localModel = [DZUserM configUserModel:[dataModel.relationships dictionaryForKey:@"users"] token:dataModel.attributes];
    // 保存 更新数据
    [[DZMobileCtrl sharedCtrl] updateRootUser:localModel];
    
    // 执行回调
    handle?handle():nil;
}




@end
