//
//  DZQNetTool+Message.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  用户私信 对话等消息


#import "DZQNetTool.h"
#import "DZQDialogModel.h"
#import "DZQMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Message)

/// 创建会话
-(void)dz_Msg_dialogCreateWithUserName:(NSString *)userName message:(NSString *)message success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 获取会话列表
-(void)dz_Msg_dialogListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 创建会话 消息
-(void)dz_Msg_dialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 获取会话消息列表
-(void)dz_Msg_dialogMessageListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
