//
//  DZQNetTool+Site_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Site_V3.h"

@implementation DZQNetTool (Site_V3)

///  前端获取配置接口 (GET)
-(void)DZQ_V3_SiteforumInfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString * URLString = DZQUrlCommonPara(DZQ_V3_SiteForum,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:URLString urlTag:urlTag success:^(id response) {
        [weakQSelf.dataLogic resV3ModelWithJSON:response dataClass:[DZQSiteV3 class] completion:^(DZQBaseRes *resModel) {
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
