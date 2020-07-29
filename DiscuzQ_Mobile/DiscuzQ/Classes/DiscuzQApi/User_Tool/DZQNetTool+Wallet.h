//
//  DZQNetTool+Wallet.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//


#import "DZQNetTool.h"
#import "DZQCashModel.h"
#import "DZQWalletModel.h"
#import "DZQCashLogModel.h"



@interface DZQNetTool (Wallet)

/// 用户钱包 详情
/// @param subCtrl User_id
-(void)dz_userWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现记录列表
/// @param query query
-(void)dz_userWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 钱包动账记录
/// @param query query
-(void)dz_userWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 提现申请
-(void)dz_userWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


