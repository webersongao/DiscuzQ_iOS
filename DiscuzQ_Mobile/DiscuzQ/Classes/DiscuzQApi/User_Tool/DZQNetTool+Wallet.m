//
//  DZQNetTool+Wallet.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Wallet.h"


@implementation DZQNetTool (Wallet)



/// 用户钱包 详情
/// @param subCtrl User_id
-(void)dz_userWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_Wallet_info,subCtrl,@"");
    
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Wallet_info, @"info") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}


/// 提现记录列表
/// @param query query
-(void)dz_userWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_Wallet_list,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Wallet_list, @"list") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}



/// 钱包动账记录
/// @param query query
-(void)dz_userWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_Wallet_log,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Wallet_log, @"log") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}

/// 提现申请
-(void)dz_userWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_Wallet_withdraw,@"",@"");
    
    NSDictionary *dataDict = @{@"cash_apply_amount":@(amount)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Wallet_withdraw, @"draw") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
    
}


@end
