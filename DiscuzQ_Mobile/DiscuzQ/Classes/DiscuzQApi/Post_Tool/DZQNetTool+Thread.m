//
//  DZQNetTool+Thread.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Thread.h"


@implementation DZQNetTool (Thread)

/// 获取 分类帖子列表
-(void)dz_threadListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_list,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_list, @"list") completion:^(DZQResModel *resModel) {
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

/// 查询主题接口[单条]
-(void)dz_threadOneWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_one,subCtrl,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_one, @"one") completion:^(DZQResModel *resModel) {
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

/// 分享主题时获取主题信息接口[单条]
-(void)dz_threadShareWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_Share,subCtrl,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_Share, @"share") completion:^(DZQResModel *resModel) {
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


/// 用户 收藏 主题列表
-(void)dz_threadFavoriteListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_favorites,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_favorites, @"favorite") completion:^(DZQResModel *resModel) {
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

/// 用户 点赞 主题列表
-(void)dz_thread_UserlikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_likes,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_likes, @"like") completion:^(DZQResModel *resModel) {
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


///// 创建主题接口
/*
 title    string    否    标题（发布帖子时必须）
 content    string    是    内容（发布帖子时支持 Markdown 语法）
 price    float    否    价格（发布帖子时可设置价格发布付费主题）
 free_words    int    否    付费主题可免费阅读字数
 type    int    是    文章类型（0: 文字 1: 帖子 2: 视频 3:图片）
 file_id    string    否    视频 file_id 视频类型文章必填
 file_name    string    否    视频文件名称
 cover_url    string    否    视频封面地址
 media_url    string    否    视频地址
 relationships.category    object    是    主题分类关联关系
 relationships.attachments    object    否    主题图片、附件关联关系
 */
-(void)dz_threadCreateWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_create,@"",@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:parameters success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_create, @"create") completion:^(DZQResModel *resModel) {
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

///// 创建视频主题
/*
 file_id    string    是    视频上传后返回的 file_id
 file_name    string    否    视频文件名称
 */
-(void)dz_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_video,@"",@"");
    
    NSDictionary *dataDict = @{@"file_id":DZQStrNull(file_id),@"file_name":DZQStrNull(file_name)};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"thread-video"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_video, @"video") completion:^(DZQResModel *resModel) {
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



///// 删除主题
-(void)dz_threadDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_delete,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_DeleteRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_delete, @"delete") completion:^(DZQResModel *resModel) {
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


///// 修改主题内容
/*
 isApproved    int    否    是否合法（0/1/2） 0 不合法 1 正常 2 忽略
 isSticky    bool    否    是否置顶
 isEssence    bool    否    是否加精
 isDeleted    bool    否    是否删除（回收站）
 isFavorite    bool    否    是否收藏
 relationships.category    bool    否    分类关联关系
 message    string    否    操作原因
 price    float    否    价格（长文、视频 可设置价格）
 title    string    否    标题（长文时必须）
 file_name    string    否    视频文件名称 视频类型文章必填
 file_id    string    否    视频 file_id 视频类型文章必填
 #请求示例
 */
-(void)dz_threadResetWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_reset,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_PatchRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_create, @"create") completion:^(DZQResModel *resModel) {
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


/// 创建云点播前端上传签名
-(void)dz_thread_UploadSignatureWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_Thread_signature,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_Thread_signature, @"signature") completion:^(DZQResModel *resModel) {
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
