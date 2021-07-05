//
//  DZQNetTool+Follow_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Follow_V1.h"


@implementation DZQNetTool (Follow_V1)


/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)DZQ_V1_FollowShipCreateWithUser:(NSString *)to_user_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Follow_create,nil,nil);
    NSDictionary *dataDict = @{@"to_user_id":DZQStrNull(to_user_id)};
    NSDictionary *attributes = @{@"type":@"user_follow",@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Follow_create, @"create") completion:^(DZQBaseRes *resModel) {
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


/// 删除（取消）关注关系
/// @param subCtrl *被关注着 id 关系参数
-(void)DZQ_V1_FollowShipDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Follow_delete,subCtrl,nil);
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Follow_delete, @"delete") completion:^(DZQBaseRes *resModel) {
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



/// 获取关注列表
-(void)DZQ_V1_FollowShipListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Follow_list,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Follow_list, @"list") completion:^(DZQBaseRes *resModel) {
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
