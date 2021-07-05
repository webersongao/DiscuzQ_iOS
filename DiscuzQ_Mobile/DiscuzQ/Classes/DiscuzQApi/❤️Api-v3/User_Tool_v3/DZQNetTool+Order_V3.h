//
//  DZQNetTool+Order_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Order_V3)


/// 用户订单 列表
/// @param query query
-(void)DZQ_V3_UserOrderListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询订单（单条）
/// @param subCtrl query
-(void)DZQ_V3_UserOrderOneWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;




@end

NS_ASSUME_NONNULL_END
