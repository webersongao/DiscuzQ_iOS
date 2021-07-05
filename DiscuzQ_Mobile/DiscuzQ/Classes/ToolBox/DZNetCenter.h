//
//  DZNetCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNetFormatter+Adapter.h"
#import "DZQNetApi_V1.h"

#define BBIMSessionManagerUpdatePropertyRespond(property)                                                             \
    GCDMulticastDelegate<BBIMSessionManagerSessionDelegate> *propertyDelegates = [self _delegatesForSessionWithID:sessionID];    \
    if ([propertyDelegates hasDelegateThatRespondsToSelector:@selector(sessionManager:didUpdateSession:property:)]) {             \
        [propertyDelegates sessionManager:self didUpdateSession:sessionID property:property];                    \
    }

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter : NSObject

@property(nonatomic, assign, readonly) NSInteger sdkVersion;  //!<
@property(nonatomic, strong, readonly) DZNetFormatter *formatter;


+ (instancetype)center;


-(void)updateNetSDkToken:(DZQTokenV1 *)tokenModel;

/// 清除缓存信息
- (void)cleanNetSDKCacheWithCompletion:(void (^)(void))completion;

-(void)dz_checkApiVersionWithCompletion:(void (^)( NSInteger version))completion;

-(void)dzx_loginOutWithCompletion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
