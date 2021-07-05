//
//  DZQNetTool+Message_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  用户私信 对话等消息


#import "DZQNetTool.h"
#import "DZQDialogV1.h"
#import "DZQMessageV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Message_V1)

/// 创建会话
-(void)DZQ_V1_DialogCreateWithUserName:(NSString *)userName message:(NSString *)message success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 获取会话列表
-(void)DZQ_V1_DialogListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 创建会话 消息
-(void)DZQ_V1_DialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 获取会话消息列表
-(void)DZQ_V1_DialogMessageListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
