//
//  DZSDKCenter+Login.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSDKCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSDKCenter (Login)

#pragma mark - qq登录
- (void)loginWithQQSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish;

#pragma mark - 微信登录
- (void)loginWithWeiXinSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish;



@end

NS_ASSUME_NONNULL_END
