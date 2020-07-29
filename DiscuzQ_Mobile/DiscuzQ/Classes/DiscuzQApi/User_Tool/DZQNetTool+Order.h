//
//  DZQNetTool+Order.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//


#import "DZQNetTool.h"
#import "DZQOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Order)

/// 用户订单 列表
/// @param query query
-(void)dz_userOrderListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询订单（单条）
/// @param subCtrl query
-(void)dz_userOrderOneWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;





@end

NS_ASSUME_NONNULL_END
