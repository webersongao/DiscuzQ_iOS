//
//  DZQNetTool+Thread_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Thread_V1.h"


@implementation DZQNetTool (Thread_V1)

/// 获取 分类帖子列表
-(void)DZQ_V1_ThreadListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_list,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_list, @"list") completion:^(DZQBaseRes *resModel) {
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

/// 查询主题接口[单条]
-(void)DZQ_V1_ThreadOneWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_one,subCtrl,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_one, @"one") completion:^(DZQBaseRes *resModel) {
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

/// 分享主题时获取主题信息接口[单条]
-(void)DZQ_V1_ThreadShareWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_Share,subCtrl,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_Share, @"share") completion:^(DZQBaseRes *resModel) {
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


/// 用户 收藏 主题列表
-(void)DZQ_V1_ThreadFavoriteListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_favorites,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_favorites, @"favorite") completion:^(DZQBaseRes *resModel) {
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

/// 用户 点赞 主题列表
-(void)DZQ_V1_Thread_UserlikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_likes,nil,query);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_likes, @"like") completion:^(DZQBaseRes *resModel) {
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


///// 创建主题接口
/*
 title    string    否    标题（发布帖子时必须）
 content    string    是    内容（发布帖子时支持 Markdown 语法）
 price    float    否    价格（发布帖子时可设置价格发布付费主题）
 attachment_price    float    否    附件价格
 free_words    int    否    付费主题可免费阅读字数百分比(使用小数)
 type    int    是    文章类型（0:文字 1:帖子 2:视频 3:图片 4:语音 5:问答 6:商品）
 longitude    float    否    经度
 latitude    float    否    纬度
 address    string    否    经纬度坐标对应的地址（如：广东省深圳市深南大道 10000 号）
 location    string    否    经纬度坐标对应的位置（如：腾讯大厦）
 file_id    string    否    视频 file_id 视频类型文章必填
 file_name    string    否    视频文件名称
 cover_url    string    否    视频封面地址
 media_url    string    否    视频地址
 is_anonymous    bool    否    是否发布匿名帖
 relationships.category    object    是    主题分类关联关系
 relationships.attachments    object    否    主题图片、附件关联关系
 relationships.question    object    否    问答帖子关联关系
 question.be_user_id    int    是    回答人的 用户 id
 question.order_id    string    是    支付成功后的 订单 id
 question.price    float    是    问答单价
 question.is_onlooker    bool    是    是否允许围观 true允许 false不允许
 question.type    int    是    0为面向所有人的悬赏帖，1为指定个人的问答帖
 question.expired_at    datetime    否    悬赏帖过期时间，当为所有人的悬赏帖时，这里是必填
 post_goods_id    int    否    商品ID
 is_draft    int    是    是否草稿箱 ，0否 ，1是
 文档地址：https://discuz.com/api-docs/v1/ThreadCreate.html
 */
-(void)DZQ_V1_ThreadCreateWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_create,@"",@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:parameters success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_create, @"create") completion:^(DZQBaseRes *resModel) {
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

///// 创建视频主题
/*
 file_id    string    是    视频上传后返回的 file_id
 file_name    string    否    视频文件名称
 */
-(void)DZQ_V1_ThreadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_video,@"",@"");
    
    NSDictionary *dataDict = @{@"file_id":DZQStrNull(file_id),@"file_name":DZQStrNull(file_name)};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"thread-video"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_video, @"video") completion:^(DZQBaseRes *resModel) {
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



///// 删除主题
-(void)DZQ_V1_ThreadDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_delete,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_delete, @"delete") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V1_ThreadResetWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_reset,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_reset, @"reset") completion:^(DZQBaseRes *resModel) {
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


/// 创建云点播前端上传签名
-(void)DZQ_V1_ThreadUploadSignatureWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_Thread_signature,nil,nil);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_Thread_signature, @"signature") completion:^(DZQBaseRes *resModel) {
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
