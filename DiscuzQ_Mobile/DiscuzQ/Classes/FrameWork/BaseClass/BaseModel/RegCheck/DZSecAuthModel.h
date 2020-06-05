//
//  DZSecAuthModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/9.
//  Copyright © 2019 WebersonGao. All rights reserved.
//  注册登录 安全验证

#import "GlobalModel.h"

@interface DZSecAuthModel : GlobalModel

@property (nonatomic, copy) NSString *sechash;  //!< sechash
@property (nonatomic, copy) NSString *seccode;  //!< 验证码
@property (nonatomic, copy) NSString *secqaa;  //!< 验证问题


@end


