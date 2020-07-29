//
//  DZQNetTool+Category.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Category.h"


@implementation DZQNetTool (Category)

/// 查询 内容分类列表
-(void)dz_categoryListWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    NSString *UrlString = DZQUrlCommonPara(DZQ_Cate_list,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Cate_list, @"list") completion:^(DZQResModel *resModel) {
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
