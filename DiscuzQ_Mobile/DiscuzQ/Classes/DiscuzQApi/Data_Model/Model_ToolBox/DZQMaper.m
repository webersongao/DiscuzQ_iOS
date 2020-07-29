//
//  DZQMaper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMaper.h"

@interface DZQMaper ()

@property (nonatomic, strong) NSDictionary *attributeMap;  //!< 模型字典
@property (nonatomic, strong) NSDictionary *relationshipMap;  //!< 接口字典

@end


@implementation DZQMaper


// 必须是 继承自 DZQSuperRelation 的类
// 每一个接口对应一行，不可以重复 和 接口复用
-(NSDictionary *)relationshipMap{
    
    return @{KDZQMapKey(DZQ_User_register,@"register") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_User_search,@"search") : kWrapper([DZQProfileRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_User_profile,@"profile") : kWrapper([DZQProfileRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_User_login,@"login") : kWrapper([DZQLoginRelationModel class], [DZQDataConvert new]),
             
             // 通知
             KDZQMapKey(DZQ_Noti_Del,@"del") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Noti_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
             // 主题
             KDZQMapKey(DZQ_Thread_one,@"one") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Thread_likes,@"like") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Thread_favorites,@"favorite") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Thread_list,@"list") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Thread_Share,@"share") : kWrapper([DZQThreadRelationModel class], [DZQDataConvert new]),
             
             // 分类
             KDZQMapKey(DZQ_Cate_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
             // 站点
             KDZQMapKey(DZQ_Site_forum,@"forum") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
             // 钱包
             KDZQMapKey(DZQ_Wallet_list,@"list") : kWrapper([DZQCashRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Wallet_log,@"log") : kWrapper([DZQCashLogRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Wallet_info,@"info") : kWrapper([DZQWalletRelationModel class], [DZQDataConvert new]),
             
             // 关注
             KDZQMapKey(DZQ_Follow_list,@"list") : kWrapper([DZQFollowRelationModel class], [DZQDataConvert new]),
             
             // 话题
             KDZQMapKey(DZQ_Topic_one,@"one") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Topic_list,@"list") : kWrapper([DZQTopicRelationModel class], [DZQDataConvert new]),
             
             // 回复
             KDZQMapKey(DZQ_Post_list,@"list") : kWrapper([DZQPostRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Post_like,@"like") : kWrapper([DZQPostRelationModel class], [DZQDataConvert new]),
             
             // 消息
             KDZQMapKey(DZQ_Msg_dialogList,@"list") : kWrapper([DZQDialogRelationModel class], [DZQDataConvert new]),
             KDZQMapKey(DZQ_Msg_messageList,@"list") : kWrapper([DZMessageRelationModel class], [DZQDataConvert new]),
             
             // 分组
             KDZQMapKey(DZQ_Group_list,@"list") : kWrapper([DZQGroupRelationModel class], [DZQDataConvert new]),
             
             // 订单
             KDZQMapKey(DZQ_Order_List,@"list") : kWrapper([DZQOrderRelationModel class], [DZQDataConvert new]),
            
             // 表情
             KDZQMapKey(DZQ_Emoji_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
             
             
             KDZQMapKey(DZQ_User_refreshToken,@"refreshToken") : kWrapper([DZQSuperRelation class], [DZQDataConvert new])
    };
}

// 必须是 继承自 DZQSuperAttribute 的类
-(NSDictionary *)attributeMap{
    return @{
        @"users":kModelWrapper([DZQUserModel class]),
        @"posts":kModelWrapper([DZQPostModel class]),
        @"token":kModelWrapper([DZQTokenModel class]),
        @"follow":kModelWrapper([DZQFollowModel class]),
        @"emoji":kModelWrapper([DZQEmojiModel class]),
        @"topics":kModelWrapper([DZQTopicModel class]),
        @"reports":kModelWrapper([DZReportModel class]),
        @"groups":kModelWrapper([DZQGroupModel class]),
        @"forums":kModelWrapper([DZQForumModel class]),
        @"threads":kModelWrapper([DZQThreadModel class]),
        @"categories":kModelWrapper([DZQCateModel class]),
        @"notification":kModelWrapper([DZQNotiModel class]),
        @"user_wallet":kModelWrapper([DZQWalletModel class]),
        @"user_wallet_cash":kModelWrapper([DZQCashModel class]),
        @"user_wallet_log":kModelWrapper([DZQCashLogModel class]),
        
        @"dialog":kModelWrapper([DZQDialogModel class]),
        @"permissions":kModelWrapper([DZQPermissionModel class]),
        @"dialog_message":kModelWrapper([DZQMessageModel class]),
        
        @"orders":kModelWrapper([DZQOrderModel class]),
        
        
        @"thread-video":kModelWrapper([DZQVideoModel class]),
        @"attachments":kModelWrapper([DZQAttachmentModel class]),
        
        
        //             @"settings":kModelWrapper([DZQNotiModel class]),
        
    };
}


- (Class)modelClassForKey:(NSString *)typeKey
{
    DZQModelWrapper *wrapper = self.attributeMap[typeKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    if ([typeKey isEqualToString:@"users"]) {
        if (1) {
            // 已登录用户
            if (3){
                // 登录用户 特定接口
            }else{
                
            }
        }else{
            // 未登录的其他用户
        }
    }else{
        
    }
    
    return wrapper.attCls;
}

- (Class)relationClassForUrlKey:(NSString *)urlKey{
    
    DZQWrapper *wrapper = self.relationshipMap[urlKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    return wrapper.relateCls;
}

- (DZQDataConvert *)dataConvertForKey:(NSString *)typeKey
{
    DZQWrapper *wrapper = self.relationshipMap[typeKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
    }
    
    return wrapper.convert;
}


#pragma mark   /********************* 工具方法 *************************/

//+(NSString *)urlkeyForRelationMap:(NSString *)urlName{
//
//    NSArray *keyArr = [urlName componentsSeparatedByString:@"_"];
//    NSString *keyStr = DZQTwoStr(urlName, DZQStrNull(keyArr.lastObject));
//
//    return keyStr;
//}


@end



