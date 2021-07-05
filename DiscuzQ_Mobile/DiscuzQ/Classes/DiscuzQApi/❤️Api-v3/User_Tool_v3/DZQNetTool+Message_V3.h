//
//  DZQNetTool+Message_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Message_V3)

/// 创建会话
-(void)DZQ_V3_DialogCreateWithUserName:(NSString *)userName message:(NSString *)message success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 获取会话列表
-(void)DZQ_V3_DialogListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 创建会话 消息
-(void)DZQ_V3_DialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 获取会话消息列表
-(void)DZQ_V3_DialogMessageListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
