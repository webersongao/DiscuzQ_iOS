//
//  DZQNetTool+Wallet_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Wallet_V3.h"

@implementation DZQNetTool (Wallet_V3)

/// 用户钱包 详情
/// @param subCtrl User_id
-(void)DZQ_V3_UserWalletInfoWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_WalletInfo,subCtrl,@"");
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_WalletInfo, @"info") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserWalletCashlistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_WalletList,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_WalletList, @"list") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserWalletLoglistWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_WalletLog,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_WalletLog, @"log") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserWalletWithdrawWithAmount:(float)amount success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_WalletWithdraw,@"",@"");
    
    NSDictionary *dataDict = @{@"cash_apply_amount":@(amount)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_WalletWithdraw, @"draw") completion:^(DZQBaseRes *resModel) {
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
