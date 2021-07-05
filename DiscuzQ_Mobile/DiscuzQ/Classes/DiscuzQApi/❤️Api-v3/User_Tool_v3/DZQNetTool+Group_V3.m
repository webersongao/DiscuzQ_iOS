//
//  DZQNetTool+Group_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Group_V3.h"

@implementation DZQNetTool (Group_V3)



/// 用户组 列表
/// @param query query
-(void)DZQ_V3_UserGroupListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{

    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_GroupList,@"",query);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_GroupList, @"list") completion:^(DZQBaseRes *resModel) {
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
