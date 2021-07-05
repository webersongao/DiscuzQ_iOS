//
//  DZQNetTool+Other_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Other_V1.h"

@implementation DZQNetTool (Other_V1)



/// 创建举报数据(主题 或 回复)
-(void)DZQ_V1_ReportThreadOrPost:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Reports_create,@"",@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:parameters success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Reports_create, @"create") completion:^(DZQBaseRes *resModel) {
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
