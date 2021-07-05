//
//  DZQNetTool+Wallet_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Wallet_V3)

/// 用户钱包 详情
/// @param subCtrl User_id
-(void)DZQ_V3_UserWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现记录列表
/// @param query query
-(void)DZQ_V3_UserWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 钱包动账记录
/// @param query query
-(void)DZQ_V3_UserWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现申请
-(void)DZQ_V3_UserWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
