//
//  DZQNetTool+Follow.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Follow.h"


@implementation DZQNetTool (Follow)


/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)dz_followShipCreateWithUser:(NSString *)to_user_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Follow_create,nil,nil);
    NSDictionary *dataDict = @{@"to_user_id":DZQStrNull(to_user_id)};
    NSDictionary *attributes = @{@"type":@"user_follow",@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Follow_create, @"create") completion:^(DZQResModel *resModel) {
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


/// 删除（取消）关注关系
/// @param subCtrl *被关注着 id 关系参数
-(void)dz_followShipDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Follow_delete,subCtrl,nil);
    DZQWEAKSELF
    [self.NetClient baidu_DeleteRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Follow_delete, @"delete") completion:^(DZQResModel *resModel) {
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



/// 获取关注列表
-(void)dz_followShipListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Follow_list,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Follow_list, @"list") completion:^(DZQResModel *resModel) {
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
