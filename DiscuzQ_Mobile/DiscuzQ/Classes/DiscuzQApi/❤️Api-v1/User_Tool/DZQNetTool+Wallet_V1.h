//
//  DZQNetTool+Wallet_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//


#import "DZQNetTool.h"
#import "DZQCashV1.h"
#import "DZQWalletV1.h"
#import "DZQCashLogV1.h"



@interface DZQNetTool (Wallet_V1)

/// 用户钱包 详情
/// @param subCtrl User_id
-(void)DZQ_V1_UserWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现记录列表
/// @param query query
-(void)DZQ_V1_UserWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 钱包动账记录
/// @param query query
-(void)DZQ_V1_UserWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现申请
-(void)DZQ_V1_UserWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


