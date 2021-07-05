//
//  DZQNetTool+Message_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Message_V3.h"

@implementation DZQNetTool (Message_V3)


/// 创建会话
/*
type    string    是    数据类型，固定值 dialog
attributes    object    是    数据属性
attributes. recipient_username    string    是    用户名
attributes. message_text    string    否    消息内容
*/
-(void)DZQ_V3_DialogCreateWithUserName:(NSString *)userName message:(NSString *)message success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_MsgDialog,@"",nil);
    NSDictionary *dataDict = @{@"recipient_username":DZQStrNull(userName),@"message_text":DZQStrNull(message)};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"dialog"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_MsgDialog, @"dialog") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
     
}


/// 获取会话列表
-(void)DZQ_V3_DialogListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_MsgDialogList,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_MsgDialogList, @"list") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
     
}

/// 创建会话 消息
-(void)DZQ_V3_DialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_MsgMessage,@"",nil);
    
    NSDictionary *dataDict = @{@"dialog_id":DZQStrNull(dialog_id),@"message_text":DZQStrNull(message),@"attachment_id":DZQStrNull(attachment_id)};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"dialog_message"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_MsgMessage, @"message") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
     
}


/// 获取会话消息列表
-(void)DZQ_V3_DialogMessageListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_MsgMessageList,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_MsgMessageList, @"list") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
     
}

@end
