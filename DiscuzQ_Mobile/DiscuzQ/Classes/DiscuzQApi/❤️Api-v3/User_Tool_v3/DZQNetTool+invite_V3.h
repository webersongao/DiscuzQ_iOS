//
//  DZQNetTool+invite_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (invite_V3)

/// 普通用户创建邀请码
-(void)DZQ_V3_UserinviteCodeWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
