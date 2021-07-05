//
//  DZQMaper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMaper.h"
#import "DZQNetApi_V1.h"

@interface DZQMaper ()

@property (nonatomic, strong) NSDictionary *attributeMap;  //!< 模型字典
@property (nonatomic, strong) NSDictionary *relationshipMap;  //!< 接口字典

@end


@implementation DZQMaper


// 必须是 继承自 DZQSuperRelation 的类
// 每一个接口对应一行，不可以重复 和 接口复用

-(NSDictionary *)relationshipMap{
    if (!_relationshipMap) {
        _relationshipMap = @{
            KDZQMapKey(DZQ_V1_User_register,@"register") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_User_search,@"search") : kWrapper([DZQUserRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_User_profile,@"profile") : kWrapper([DZQUserRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_User_login,@"login") : kWrapper([DZQLoginRelationV1 class], [DZQDataConvert new]),
            
            // 通知
            KDZQMapKey(DZQ_V1_Noti_Del,@"del") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Noti_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            
            // 主题
            KDZQMapKey(DZQ_V1_Thread_one,@"one") : kWrapper([DZQThreadRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Thread_likes,@"like") : kWrapper([DZQThreadRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Thread_favorites,@"favorite") : kWrapper([DZQThreadRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Thread_list,@"list") : kWrapper([DZQThreadRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Thread_Share,@"share") : kWrapper([DZQThreadRelationV1 class], [DZQDataConvert new]),
            
            // 分类
            KDZQMapKey(DZQ_V1_Cate_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            
            // 站点
            KDZQMapKey(DZQ_V1_Site_forum,@"forum") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            
            // 钱包
            KDZQMapKey(DZQ_V1_Wallet_list,@"list") : kWrapper([DZQCashRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Wallet_log,@"log") : kWrapper([DZQCashLogRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Wallet_info,@"info") : kWrapper([DZQWalletRelationV1 class], [DZQDataConvert new]),
            
            // 关注
            KDZQMapKey(DZQ_V1_Follow_list,@"list") : kWrapper([DZQFollowRelationV1 class], [DZQDataConvert new]),
            
            // 话题
            KDZQMapKey(DZQ_V1_Topic_one,@"one") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Topic_list,@"list") : kWrapper([DZQTopicRelationV1 class], [DZQDataConvert new]),
            
            // 回复
            KDZQMapKey(DZQ_V1_Post_list,@"list") : kWrapper([DZQPostRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Post_like,@"like") : kWrapper([DZQPostRelationV1 class], [DZQDataConvert new]),
            
            // 消息
            KDZQMapKey(DZQ_V1_Msg_dialogList,@"list") : kWrapper([DZQDialogRelationV1 class], [DZQDataConvert new]),
            KDZQMapKey(DZQ_V1_Msg_messageList,@"list") : kWrapper([DZMessageRelationV1 class], [DZQDataConvert new]),
            
            // 分组
            KDZQMapKey(DZQ_V1_Group_list,@"list") : kWrapper([DZQGroupRelationV1 class], [DZQDataConvert new]),
            
            // 订单
            KDZQMapKey(DZQ_V1_Order_List,@"list") : kWrapper([DZQOrderRelationV1 class], [DZQDataConvert new]),
            
            // 表情
            KDZQMapKey(DZQ_V1_Emoji_list,@"list") : kWrapper([DZQSuperRelation class], [DZQDataConvert new]),
            
            
            KDZQMapKey(DZQ_V1_User_refreshToken,@"refreshToken") : kWrapper([DZQSuperRelation class], [DZQDataConvert new])
        };
    }
    return _relationshipMap;
}

// 必须是 继承自 DZQSuperAttribute 的类
-(NSDictionary *)attributeMap{
    if (!_attributeMap) {
        _attributeMap = @{
            @"users":kModelWrapper([DZQUserV1 class]),
            @"posts":kModelWrapper([DZQPostV1 class]),
            @"token":kModelWrapper([DZQTokenV1 class]),
            @"follow":kModelWrapper([DZQFollowV1 class]),
            @"emoji":kModelWrapper([DZQEmojiV1 class]),
            @"topics":kModelWrapper([DZQTopicV1 class]),
            @"reports":kModelWrapper([DZReportV1 class]),
            @"post_goods":kModelWrapper([DZQGoodsV1 class]),
            @"groups":kModelWrapper([DZQGroupV1 class]),
            @"forums":kModelWrapper([DZQSiteV1 class]),
            @"threads":kModelWrapper([DZQThreadV1 class]),
            @"categories":kModelWrapper([DZQCateV1 class]),
            @"notification":kModelWrapper([DZQNotiV1 class]),
            @"user_wallet":kModelWrapper([DZQWalletV1 class]),
            @"user_wallet_cash":kModelWrapper([DZQCashV1 class]),
            @"user_wallet_log":kModelWrapper([DZQCashLogV1 class]),
            @"question_answer":kModelWrapper([DZQQesAnswerV1 class]),
            @"everybody_question":kModelWrapper([DZQGratuityV1 class]),
            
            @"dialog":kModelWrapper([DZQDialogV1 class]),
            @"permissions":kModelWrapper([DZQPermissionV1 class]),
            @"dialog_message":kModelWrapper([DZQMessageV1 class]),
            
            @"orders":kModelWrapper([DZQOrderV1 class]),
            
            @"thread-video":kModelWrapper([DZQVideoV1 class]),
            @"attachments":kModelWrapper([DZQAttachmentV1 class]),
            
            
            //             @"settings":kModelWrapper([DZQNotiV1 class]),
            
        };
    }
    return _attributeMap;
}

- (Class)modelClassForKey:(NSString *)typeKey
{
    DZQModelWrapper *wrapper = self.attributeMap[typeKey];
    if (!wrapper || (id)wrapper == [NSNull null]) {
        return nil;
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




@end



