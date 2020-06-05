//
//  DZMsgDataTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMsgDataTool.h"
#import "DZNotiListStyle.h"

@implementation DZMsgDataTool

+(NSArray<DZNotiItem *>*)messageListData:(DZQUnReadModel *)unModel{
    
    DZNotiItem *Model00 = [[DZNotiItem alloc] initWithNotiType:DZMList_relate count:unModel.related];
    DZNotiItem *Model01 = [[DZNotiItem alloc] initWithNotiType:DZMList_reply count:unModel.replied];
    DZNotiItem *Model02 = [[DZNotiItem alloc] initWithNotiType:DZMList_like count:unModel.liked];
    DZNotiItem *Model03 = [[DZNotiItem alloc] initWithNotiType:DZMList_reward count:unModel.rewarded];
    DZNotiItem *Model04 = [[DZNotiItem alloc] initWithNotiType:DZMList_System count:unModel.system];
    DZNotiItem *Model05 = [[DZNotiItem alloc] initWithNotiType:DZMList_withdrawal count:unModel.withdrawal];
    
    NSArray *cellDataArr = @[Model00,Model01,Model02,Model03,Model04,Model05];
    
    return cellDataArr;
    
}

/// 用户 消息数量
+ (void)dzx_NotiCountInfoWithCompletion:(void (^)(DZQUnReadModel * unReadModel,NSInteger count,BOOL success))completion{
    
    NSString *userId = [DZMobileCtrl sharedCtrl].User.user_id;
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:YES completion:^(DZQResModel * varModel, BOOL bSuccess) {
        
        DZQUserModel *UserModel = (DZQUserModel *)varModel.dataBody.firstObject.attributes;
        
        if (completion) {
            completion(UserModel.typeUnreadNotifications,UserModel.unreadNotifications,bSuccess);
        }
        
    }];
}


/// 不分类别的获取用户 所有未读消息
+(void)dzx_NotiListOfMyUserWithCompletion:(void (^)(NSArray<DZNotiItem *> *varModel, BOOL success))completion{
    
    [[DZNetCenter center] dzx_notiListWithTypeFilter:nil completion:^(NSArray<DZQDataNoti *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
        
        for (DZQNotiModel *model in varModel) {
            if ([model.type isEqualToString:@"system"]) {
                // 系统
            }else if ([model.type isEqualToString:@"replied"]){
                // 回复
            }else if ([model.type isEqualToString:@"liked"]){
                // 点赞
            }else if ([model.type isEqualToString:@"rewarded"]){
                // 打赏
            }else if ([model.type isEqualToString:@"related"]){
                // @我的
            }else if ([model.type isEqualToString:@"withdrawal"]){
                // 提现
            }
        }
        // 转化 DZQDataModel 数组 为 DZNotiItem 数组
        if (completion) {
            completion(nil,hasMore);
        }
    }];
}



+(NSArray<DZQDataNoti *>*)NotiResData:(NSArray <DZQBodyModel *> *)NotiDataBody{
    
    NSMutableArray *notiDataArray = [NSMutableArray array];
    
    for (DZQBodyModel *body in NotiDataBody) {
        DZQDataNoti *dataNoti = [[DZQDataNoti alloc] init];
        
        dataNoti.type = body.type;
        dataNoti.type_id = body.type_id;
        dataNoti.attributes = (DZQNotiModel *)body.attributes;
        
        dataNoti.styleModel = [DZNotiListStyle inner_dataStyle:dataNoti];
        
        [notiDataArray addObject:dataNoti];
    }
    
    return [notiDataArray copy];
}


-(void)config_DataAttributes:(DZQNotiModel *)notiModel{
    
    if ([notiModel.type isEqualToString:DZMList_System]) {
        notiModel.user_name = @"系统通知";
    }
    
}


@end
