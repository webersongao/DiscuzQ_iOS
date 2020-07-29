//
//  DZQNetTool+Other.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Other.h"

@implementation DZQNetTool (Other)



/// 创建举报数据(主题 或 回复)
-(void)dz_threadOrPostReportWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Reports_create,@"",@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:parameters success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Reports_create, @"create") completion:^(DZQResModel *resModel) {
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
