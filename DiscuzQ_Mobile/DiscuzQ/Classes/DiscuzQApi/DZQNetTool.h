//
//  DZQNetTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZErrorFormarter.h"
#import "DZQMacroHeader.h"

@class DZQTokenV1;
@interface DZQNetTool : NSObject

+ (instancetype)shared;

@property (nonatomic, assign, readonly) BOOL tokenExpired;  //!< 用户Token
@property (nonatomic, assign, readonly) NSInteger version;  //!< 属性注释
@property (nonatomic, strong, readonly) DZQDataLogic *dataLogic;  //!< 相应数据格式化
@property (nonatomic, strong, readonly) DZErrorFormarter *formarter;  /// 字段格式化
@property (nonatomic, strong, readonly) PRBaiduHttpClient *NetClient;  //!< 网络请求类



-(void)updateSDKVersion:(NSInteger)version;

-(void)updateDZQSDKToken:(DZQTokenV1 *)tokenModel;

/// 退出登录
-(void)DZQ_LoginOutWithCompletion:(PRNoneBlock)completion;

/// 清除缓存信息
- (void)cleanUplogicCacheWithCompletion:(void (^)(void))completion;



@end







