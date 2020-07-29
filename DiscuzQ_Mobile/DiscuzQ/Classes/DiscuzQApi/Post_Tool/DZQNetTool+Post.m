//
//  DZQNetTool+Post.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Post.h"


@implementation DZQNetTool (Post)


/// 查询 回复 接口[列表]
-(void)dz_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Post_list,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Post_list, @"list") completion:^(DZQResModel *resModel) {
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

/// 查询我点赞的帖子接口[列表]
-(void)dz_PostLikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Post_like,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Post_like, @"like") completion:^(DZQResModel *resModel) {
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



/// 创建回复
/*
 threadId    int    是    主题 id
 replyId    int    否    回复 id
 content    string    是    内容
 isComment    bool    否    是否是回复的评论（楼中楼）
 longitude    float    否    经度
 latitude    float    否    纬度
 */
-(void)dz_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Post_create,@"",nil);
    
    NSDictionary *paraDict = @{@"threadId":DZQStrNull(threadId),@"replyId":DZQStrNull(replyId),@"content":DZQStrNull(content),
                               @"isComment":@(isComment)/*,@"longitude":@(0),@"latitude":@(0)*/};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Post_create, @"create") completion:^(DZQResModel *resModel) {
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


/// 删除回复
-(void)dz_PostDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Post_delete,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_DeleteRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Post_delete, @"delete") completion:^(DZQResModel *resModel) {
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


/// 修改回复
-(void)dz_PostResetWithSubCtrl:(NSString *)subCtrl dataDict:(NSDictionary *)dataDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Post_reset,subCtrl,nil);
    
    if (!dataDict || !dataDict.allValues.count) {
        return;
    }
    
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"posts"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PatchRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Post_reset, @"reset") completion:^(DZQResModel *resModel) {
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
