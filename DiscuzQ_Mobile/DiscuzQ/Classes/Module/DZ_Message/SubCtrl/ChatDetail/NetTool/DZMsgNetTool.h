//
//  DZMsgNetTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/11.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResModel.h"

@interface DZMsgNetTool : NSObject

// 发送私信 多参数
+(void)DZ_SendMsgToOtherUser:(NSString *)message UserNamme:(NSString *)userName touid:(NSString *)touid completion:(void(^)(BaseResModel *resModel,NSError *error))completion;


/// 删除 单个人 消息
+ (void)DZ_DeleteOneMessage:(NSString *)touid Pid:(NSString *)Pid completion:(void(^)(BaseResModel *resModel,NSError *error))completion;


+(void)dzx_NotiListOfMyUserWithCompletion:(void (^)(NSArray<DZNotiItem *> *varModel, BOOL success))completion;



@end






