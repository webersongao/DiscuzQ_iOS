//
//  DZQNetTool+Post_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Post_V1.h"

@implementation DZQNetTool (Post_V1)


/// 查询 回复 接口[列表]
-(void)DZQ_V1_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Post_list,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Post_list, @"list") completion:^(DZQBaseRes *resModel) {
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

/// 查询我点赞的帖子接口[列表]
-(void)DZQ_V1_PostLikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Post_like,@"",query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Post_like, @"like") completion:^(DZQBaseRes *resModel) {
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



/// 创建回复
/*
 threadId    int    是    主题 id
 replyId    int    否    回复 id
 content    string    是    内容
 isComment    bool    否    是否是回复的评论（楼中楼）
 longitude    float    否    经度
 latitude    float    否    纬度
 */
-(void)DZQ_V1_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Post_create,@"",nil);
    
    NSDictionary *paraDict = @{@"threadId":DZQStrNull(threadId),@"replyId":DZQStrNull(replyId),@"content":DZQStrNull(content),
                               @"isComment":@(isComment)/*,@"longitude":@(0),@"latitude":@(0)*/};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Post_create, @"create") completion:^(DZQBaseRes *resModel) {
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


/// 删除回复
-(void)DZQ_V1_PostDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Post_delete,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Post_delete, @"delete") completion:^(DZQBaseRes *resModel) {
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


/// 修改回复
-(void)DZQ_V1_PostResetWithSubCtrl:(NSString *)subCtrl dataDict:(NSDictionary *)dataDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Post_reset,subCtrl,nil);
    
    if (!dataDict || !dataDict.allValues.count) {
        return;
    }
    
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"posts"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Post_reset, @"reset") completion:^(DZQBaseRes *resModel) {
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
