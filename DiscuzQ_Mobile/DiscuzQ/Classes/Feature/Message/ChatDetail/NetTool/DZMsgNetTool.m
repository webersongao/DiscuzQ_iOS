//
//  DZMsgNetTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/11.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMsgNetTool.h"

@implementation DZMsgNetTool


// 发送私信 多参数
+(void)DZ_SendMsgToOtherUser:(NSString *)message UserNamme:(NSString *)userName touid:(NSString *)touid completion:(void(^)(BaseResModel *resModel,NSError *error))completion{
    
    if (!completion || !message.length || !userName.length || !touid.length) {
        return;
    }
    
    if (completion) {
        completion(nil,nil);
    }
}


// 删除 单个人 消息
+ (void)DZ_DeleteOneMessage:(NSString *)touid Pid:(NSString *)Pid completion:(void(^)(BaseResModel *resModel,NSError *error))completion{
    
    if (!completion || !touid.length || !Pid.length) {
        return;
    }
    
    if (completion) {
        completion(nil,nil);
    }
    
}



@end




















