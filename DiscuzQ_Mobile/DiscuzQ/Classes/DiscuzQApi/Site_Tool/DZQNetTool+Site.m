//
//  DZQNetTool+Site.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Site.h"


@implementation DZQNetTool (Site)


-(void)dz_siteinfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString * URLString = DZQUrlCommonPara(DZQ_Site_forum,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:URLString urlTag:urlTag success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Site_forum, @"forum") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:^{
    }];
    
}


@end
