//
//  DZNotiDataTool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNotiItem.h"


@interface DZNotiDataTool : NSObject

+(NSArray<DZNotiItem *>*)messageListData:(DZQUnReadV1 *)unModel;

/// 用户 消息数量
+ (void)dzx_NotiCountInfoWithCompletion:(void (^)(DZQUnReadV1 * unReadModel,NSInteger count,BOOL success))completion;


+(NSArray<DZQDataNoti *>*)NotiResData:(NSArray <DZQBodyV1 *> *)NotiDataBody;


@end


