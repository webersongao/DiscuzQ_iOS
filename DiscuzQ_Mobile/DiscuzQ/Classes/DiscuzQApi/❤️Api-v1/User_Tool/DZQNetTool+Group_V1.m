//
//  DZQNetTool+Group_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Group_V1.h"


@implementation DZQNetTool (Group_V1)




/// 用户组 列表
/// @param query query
-(void)DZQ_V1_UserGroupListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Group_list,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Group_list, @"list") completion:^(DZQBaseRes *resModel) {
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
