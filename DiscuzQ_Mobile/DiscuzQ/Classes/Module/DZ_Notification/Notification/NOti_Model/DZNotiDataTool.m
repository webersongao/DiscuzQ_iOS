//
//  DZNotiDataTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNotiDataTool.h"
#import "DZNotiDetailStyle.h"

@implementation DZNotiDataTool

+(NSArray<DZNotiItem *>*)messageListData:(DZQUnReadV1 *)unModel{
    
    DZNotiItem *Model00 = [[DZNotiItem alloc] initWithNotiType:DZMList_relate count:unModel.related];
    DZNotiItem *Model01 = [[DZNotiItem alloc] initWithNotiType:DZMList_reply count:unModel.replied];
    DZNotiItem *Model02 = [[DZNotiItem alloc] initWithNotiType:DZMList_like count:unModel.liked];
    DZNotiItem *Model03 = [[DZNotiItem alloc] initWithNotiType:DZMList_reward count:unModel.rewarded];
    DZNotiItem *Model04 = [[DZNotiItem alloc] initWithNotiType:DZMList_withdrawal count:unModel.withdrawal];
    DZNotiItem *Model05 = [[DZNotiItem alloc] initWithNotiType:DZMList_questioned count:unModel.questioned];
    DZNotiItem *Model06 = [[DZNotiItem alloc] initWithNotiType:DZMList_System count:unModel.system];
    
    NSArray *cellDataArr = @[Model00,Model01,Model02,Model03,Model04,Model05,Model06];
    
    return cellDataArr;
    
}

/// 用户 消息数量
+ (void)dzx_NotiCountInfoWithCompletion:(void (^)(DZQUnReadV1 * unReadModel,NSInteger count,BOOL success))completion{
    
    NSString *userId = [DZMobileCtrl sharedCtrl].User.user_id;
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:YES completion:^(DZQDataUser * dataModel, BOOL bSuccess) {
        DZQUserV1 *UserModel = (DZQUserV1 *)dataModel.attributes;
        if (completion) {
            completion(UserModel.typeUnreadNotifications,UserModel.unreadNotifications,bSuccess);
        }
    } failure:^(DZQErrorV1 * _Nonnull varModel) {
        if (completion) {
            completion(nil,0,NO);
        }
    }];
}


+(NSArray<DZQDataNoti *>*)NotiResData:(NSArray <DZQBodyV1 *> *)NotiDataBody{
    
    NSMutableArray *notiDataArray = [NSMutableArray array];
    
    for (DZQBodyV1 *body in NotiDataBody) {
        DZQDataNoti *dataNoti = [[DZQDataNoti alloc] initWithResBody:body style:[DZNotiDetailStyle class]];
//        dataNoti.type = body.type;
//        dataNoti.inner_id = body.inner_id;
//        dataNoti.attributes = (DZQNotiV1 *)body.attributes;
//        if ([dataNoti.attributes.type isEqualToString:@"system"]) {
//            dataNoti.attributes.user_name = dataNoti.attributes.user_name.length ? dataNoti.attributes.user_name : @"系统通知小助手";
//        }
//        dataNoti.styleModel = [DZNotiDetailStyle inner_dataStyle:dataNoti];
        [notiDataArray addObject:dataNoti];
    }
    
    return [notiDataArray copy];
}


-(void)config_DataAttributes:(DZQNotiV1 *)notiModel{
    
    if ([notiModel.type isEqualToString:DZMList_System]) {
        notiModel.user_name = @"系统通知";
    }
    
}


@end
