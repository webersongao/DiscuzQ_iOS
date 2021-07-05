//
//  DZState.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


#define KQState(xBool,yCode,zDesc) [DZState initState:xBool code:yCode desc:zDesc]

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    DZStateNone,  // 默认，成功
    // 验证码
    DZStateNoCaptchaId,
    DZStateCaptchaFail,
    DZStateNoNeedCaptcha,
} DZStateCode;

@interface DZState : NSObject

@property (nonatomic, assign) BOOL success;  //!< 成功与否
@property (nonatomic, assign) DZStateCode code;  //!< 状态码
@property (nonatomic, copy) NSString *stateDesc;  //!<  描述



+(instancetype)initState:(BOOL)isSuccess code:(DZStateCode)code desc:(NSString *)desc;




@end

NS_ASSUME_NONNULL_END
