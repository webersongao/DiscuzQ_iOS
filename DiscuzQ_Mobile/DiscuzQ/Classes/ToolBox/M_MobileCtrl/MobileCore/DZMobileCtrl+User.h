//
//  DZMobileCtrl+User.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMobileCtrl (User)

/*
 *  退出登录，清空用户信息
 */
- (void)signoutWithCompletion:(void (^)(void))completion;

/*
 * 设置自动登录状态
 */
- (void)localUserAutoLogin;

- (BOOL)checkLoginName:(NSString *)userName Pwd:(NSString *)password;

// 保存登录数据
- (void)saveLoginUserData:(NSDictionary *)dataDict andHandle:(void(^)(void))handle;



@end

NS_ASSUME_NONNULL_END
