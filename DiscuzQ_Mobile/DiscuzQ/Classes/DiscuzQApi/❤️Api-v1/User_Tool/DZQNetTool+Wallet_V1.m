//
//  DZQNetTool+Wallet_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Wallet_V1.h"


@implementation DZQNetTool (Wallet_V1)

/// 用户钱包 详情
/// @param subCtrl User_id
-(void)DZQ_V1_UserWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Wallet_info,subCtrl,@"");
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Wallet_info, @"info") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
    
}


/// 提现记录列表
/// @param query query
-(void)DZQ_V1_UserWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Wallet_list,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Wallet_list, @"list") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
    
}



/// 钱包动账记录
/// @param query query
-(void)DZQ_V1_UserWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Wallet_log,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Wallet_log, @"log") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
    
}

/// 提现申请
-(void)DZQ_V1_UserWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Wallet_withdraw,@"",@"");
    
    NSDictionary *dataDict = @{@"cash_apply_amount":@(amount)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Wallet_withdraw, @"draw") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
    
}


@end
