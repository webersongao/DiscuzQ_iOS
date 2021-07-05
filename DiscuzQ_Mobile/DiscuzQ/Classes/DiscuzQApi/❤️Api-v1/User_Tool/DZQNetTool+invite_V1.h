//
//  DZQNetTool+invite_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//


#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (invite_V1)

/// 普通用户创建邀请码
-(void)DZQ_V1_UserinviteCodeWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
