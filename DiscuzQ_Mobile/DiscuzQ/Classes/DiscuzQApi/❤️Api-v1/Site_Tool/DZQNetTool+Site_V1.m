//
//  DZQNetTool+Site_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Site_V1.h"


@implementation DZQNetTool (Site_V1)


-(void)DZQ_V1_SiteforumInfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString * URLString = DZQUrlCommonPara(DZQ_V1_Site_forum,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:URLString urlTag:urlTag success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Site_forum, @"forum") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
        
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:^{
    }];
    
}


@end
