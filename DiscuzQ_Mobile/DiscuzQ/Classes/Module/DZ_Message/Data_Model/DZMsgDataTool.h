//
//  DZMsgDataTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNotiItem.h"


@interface DZMsgDataTool : NSObject

+(NSArray<DZNotiItem *>*)messageListData:(DZQUnReadModel *)unModel;

/// 用户 消息数量
+ (void)dzx_NotiCountInfoWithCompletion:(void (^)(DZQUnReadModel * unReadModel,NSInteger count,BOOL success))completion;



/// 不分类别的获取用户 所有未读消息
+(void)dzx_NotiListOfMyUserWithCompletion:(void (^)(NSArray<DZNotiItem *> *varModel, BOOL success))completion;

+(NSArray<DZQDataNoti *>*)NotiResData:(NSArray <DZQBodyModel *> *)NotiDataBody;


@end


