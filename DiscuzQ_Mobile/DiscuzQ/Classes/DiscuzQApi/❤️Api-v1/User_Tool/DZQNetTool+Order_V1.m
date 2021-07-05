//
//  DZQNetTool+Order_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Order_V1.h"


@implementation DZQNetTool (Order_V1)



/// 用户订单 列表
/// @param query query
-(void)DZQ_V1_UserOrderListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Order_List,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Order_List, @"list") completion:^(DZQBaseRes *resModel) {
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

/// 查询订单（单条）
/// @param subCtrl query
-(void)DZQ_V1_UserOrderOneWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Order_One,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Order_One, @"one") completion:^(DZQBaseRes *resModel) {
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
