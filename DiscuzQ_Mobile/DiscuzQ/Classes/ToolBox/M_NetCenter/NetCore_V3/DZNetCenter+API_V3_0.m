//
//  DZNetCenter+API_V3_0.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+API_V3_0.h"

@implementation DZNetCenter (API_V3_0)

#pragma mark   /*************** Site ***************/

/// 全部 Emoji表情[列表]
-(void)dzApiv3_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *resModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_EmojiListWithSuccess:^(DZQResV1 * resModel, BOOL success) {
        if (completion) {
            NSArray *dataArray = resModel.dataBody;
            completion(dataArray,success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

//// 获取站点基本信息
-(void)dzApiv3_siteforumInfoWithCompletion:(void (^)(DZQSiteV3 *siteModel, BOOL success))completion{
   
    [[DZQNetTool shared] DZQ_V3_SiteforumInfoWithUrlTag:1125 success:^(DZQResV3 * resModel, BOOL success) {
        if (completion) {
            DZQSiteV3 *siteModel = (DZQSiteV3 *)resModel.resData.firstObject;
            completion(siteModel,success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 获取 分类列表
-(void)dzApiv3_categoryListWithCompletion:(void (^)(NSArray<DZQCateV3 *> *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_CategoryListWithSuccess:^(DZQResV3 * resModel, BOOL success) {
        NSArray *cateMArray = resModel.resData;
        if (completion) {
            completion(cateMArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


#pragma mark   /*************** Post ***************/

/*
 filter[q]    string    否    关键词
 filter[userId]    int    否    作者 ID
 filter[username]    string    否    作者用户名
 filter[deletedUserId]    int    否    操作删除者 ID
 filter[deletedUsername]    string    否    操作删除者用户名
 filter[createdAtBegin]    string    否    发表于（开始时间）
 filter[createdAtEnd]    string    否    发表于（结束时间）
 filter[deletedAtBegin]    string    否    删除于（开始时间）
 filter[deletedAtEnd]    string    否    删除于（结束时间）
 filter[categoryId]    int    否    分类 ID
 filter[thread]    int    否    主题 ID
 filter[reply]    int    否    回复 ID
 filter[isApproved]    string    否    是否合法（0/1/2） 0 不合法 1 正常 2 忽略
 filter[isDeleted]    string    否    是否删除（yes/no）
 filter[isComment]    string    否    是否是回复的评论（yes/no）
 filter[highlight]    string    否    是否高亮敏感词（yes/no）
 
 */

/// 查询 特定主题 回复 接口[列表]
-(void)dzApiv3_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[thread]=%@",thread_id];
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 特定关键字 回复 接口[列表]
-(void)dzApiv3_PostListWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[q]=%@",keyWord];
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 特定用户 回复 接口[列表]
-(void)dzApiv3_PostListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[userId]=%@",userId];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定 用户名 回复 接口[列表]
-(void)dzApiv3_PostListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[username]=%@",username];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定分类下 回复 接口[列表]
-(void)dzApiv3_PostListWithCate:(NSString *)categoryId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@",categoryId];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定回复 的二级回复接口[列表]
-(void)dzApiv3_PostListWithReply:(NSString *)reply_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[reply]=%@&filter[isComment]=yes",reply_id];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 回复 接口[列表]
-(void)inner_PostListFilterWithfilter:(NSString *)filter page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    page = (page <= 0) ? 1 : page;
    NSString *defaultStr = @"user,replyUser,images,thread";
    NSString *query = [NSString stringWithFormat:@"%@&filter[isApproved]=1&filter[isDeleted]=no&include=%@&page[number]=%ld&page[limit]=20",filter,defaultStr,(long)page];
    
    [[DZQNetTool shared] DZQ_V3_PostListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion && resModel.success) {
                    completion(dataArray,resModel.hasMore);
                }else{
                    if (completion) {
                        completion(nil,NO);
                    }
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}



/// 上传附件
/*
 file    file    是    上传的文件
 isGallery    int    否    是否是帖子图片：0 不是，1 是
 isSound    int    否    是否是音频：0 文件 1 音频 2 视频
 */
-(void)dzApiv3_attachmentUploadWithFile:(NSString *)filePath isGallery:(NSInteger)isGallery isSound:(NSInteger)isSound progress:(void (^)(double progress))backProgress completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *queryStr = [NSString stringWithFormat:@"isGallery=%ld&isSound=%ld",isGallery,isSound];
    
    [[DZQNetTool shared] DZQ_V3_AttachmentUploadWithQuery:queryStr file:filePath success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil; //[DZHomeTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } progress:^(double progress) {
        if (backProgress) {
            backProgress(progress);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}


/// 删除 附件
-(void)dzApiv3_attachmentDeleteWithUUid:(NSString *)uuid completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_AttachmentDeleteWithSubCtrl:uuid success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}
    

///  举报——回复
/*
 user_id    int    是    用户ID    举报人的用户ID
 thread_id    int    否    主题ID    举报[主题/回复内容]都会传输
 post_id    int    否    回复ID    如果举报的主题则不需要传输该ID
 type    int    是    举报类型    0个人主页 1主题 2评论/回复
 reason    string    是    举报理由    必传举报理由
 */
-(void)dzApiv3_postReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion{
    [self inner_threadOrPostReportWithUser:user_id thread:thread_id post:post_id reason:reason type:2 completion:completion];
}

///  举报——主题
/*
 user_id    int    是    用户ID    举报人的用户ID
 thread_id    int    否    主题ID    举报[主题/回复内容]都会传输
 type    int    是    举报类型    0个人主页 1主题 2评论/回复
 reason    string    是    举报理由    必传举报理由
 */
-(void)dzApiv3_threadReportWithUser:(NSString *)user_id thread:(NSString *)thread_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion{
    
    [self inner_threadOrPostReportWithUser:user_id thread:thread_id post:@"" reason:reason type:1 completion:completion];
    
}
    

/// 创建举报数据(主题 或 回复)
/*
 user_id    int    是    用户ID    举报人的用户ID
 thread_id    int    否    主题ID    举报[主题/回复内容]都会传输
 post_id    int    否    回复ID    如果举报的主题则不需要传输该ID
 type    int    是    举报类型    0个人主页 1主题 2评论/回复
 reason    string    是    举报理由    必传举报理由
 */
-(void)inner_threadOrPostReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason type:(NSInteger)type completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion{
    
    if (!user_id.length || !reason.length || !thread_id.length) {
        if (completion) {
            completion(nil,NO);
        }
    }
    
    NSDictionary *innerDict = @{@"user_id":checkNull(user_id),
                               @"thread_id":checkNull(thread_id),
                               @"post_id":checkNull(post_id),
                               @"reason":checkNull(reason),
                               @"type":@(type)};
    
    NSDictionary *paraDict = [DZNetFormatter parameterType:@"reports" attributes:innerDict];
    
    [[DZQNetTool shared] DZQ_V3_ReportThreadOrPost:paraDict success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}




/// 获取话题列表
/// @param content 话题内容（模糊查询）
/// @param username 话题作者
/*
 include    string    否    关联数据
 filter[content]    string    否    话题内容（模糊查询）
 filter[username]    string    否    话题作者
 filter[createdAtBegin]    datetime    否    话题创建时间范围-开始
 filter[createdAtEnd]    datetime    否    话题创建时间范围-截止
 filter[threadCountBegin]    int    否    话题主题数范围-起始
 filter[threadCountEnd]    int    否    话题主题数范围-截止
 filter[viewCountBegin]    int    否    话题热度范围-起始
 filter[viewCountEnd]    int    否    话题热度范围-截止
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 sort    string    否    默认按照创建时间倒序，可选值：主题量threadCount、浏览量viewCount、创建时间createdAt。添加标记‘-’为倒序，如：‘-threadCount’；
 
 #include 可关联的数据
 user    users    object    否    话题创建人
 lastThread    threads    object    否    最新主题
 lastThread.firstPost    posts    object    否    最新主题的首帖
 lastThread.firstPost.images    attachments    object    否    最新主题首帖的图片
 示例:
 /api/topics?filter[content]=1&include=user&page[number]=1&page[limit]=10&sort=-viewCount
 */
-(void)dzApiv3_TopicListOfThreadWithKey:(NSString *)content username:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = @"include=user,lastThread,lastThread.firstPost,lastThread.firstPost.images";
    NSString *queryStr = [NSString stringWithFormat:@"%@&filter[content]=%@&filter[username]=%@&sort=page[number]=%ld&page[limit]=20",includeStr,content,username,page];
    
    [[DZQNetTool shared] DZQ_V3_TopicListOfThreadWithQuery:queryStr success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}


/// 查询话题接口[单条]
/// @param topic_id 话题Id
-(void)dzApiv3_TopicOneOfThreadWithTopic:(NSString *)topic_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    topic_id = checkNull(topic_id);
    if (!topic_id.length) {
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_TopicOneOfThreadWithSubCtrl:topic_id success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 创建回复
-(void)dzApiv3_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    content = checkNull(content);
    if (!content.length) {
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_PostCreateWithThread:threadId replyId:replyId content:content isComment:isComment success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataPost *data = (DZQDataPost *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 删除回复
-(void)dzApiv3_PostDeleteWithPost:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    comment_id = checkNull(comment_id);
    if (!comment_id.length) {
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_PostDeleteWithSubCtrl:comment_id success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataPost *data = (DZQDataPost *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/*
 content    string    否    内容
 isApproved    int    否    是否合法（0/1/2） 0 不合法 1 正常 2 忽略
 isDeleted    bool    否    是否删除（回收站）
 isLiked    bool    否    是否喜欢
 message    string    否    操作原因
 */
/// 修改回复 -- 忽略
-(void)dzApiv3_PostIgnoreWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isApproved":@(2)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 删除
-(void)dzApiv3_PostDeleteWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isDeleted":@(1)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 喜欢
-(void)dzApiv3_PostLikeOrNotWithPost:(NSString *)Post_id isLiked:(BOOL)isLiked completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isLiked":@((isLiked ? 1 : 0))};
    [self inner_PostResetWithPost:Post_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 修改内容
-(void)dzApiv3_PostResetContentWithSubCtrl:(NSString *)comment_id Content:(NSString *)content completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    // 增加 content 即可修改回复内容，但是目前不给用户修改的机会
    NSDictionary *dataDict = @{@"content":DZQStrNull(content)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复
-(void)inner_PostResetWithPost:(NSString *)comment_id dataDict:(NSDictionary *)dataDict completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_PostResetWithSubCtrl:comment_id dataDict:dataDict success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataPost *data = (DZQDataPost *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


#pragma mark   /*************** User ***************/

/// 退出登录
-(void)dzApiv3_loginOutWithCompletion:(void (^)(void))completion{
    
    [[DZQNetTool shared] DZQ_LoginOutWithCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzApiv3_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQAuthV1 *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_RegisterWithName:username password:password token:nil mobile:nil code:nil success:^(DZQResV1 * resModel, BOOL success) {
        DZQAuthV1 *regModel = (DZQAuthV1 *)resModel.dataBody.firstObject.attributes;
        if (completion) {
            completion(regModel,success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


//// 用户登录
-(void)dzApiv3_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserV1 *userModel,DZQTokenV1 *tokenModel,BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_LoginWithName:username password:password token:nil mobile:mobile success:^(DZQResV1 *resModel,BOOL success) {
        
        DZQTokenV1 *token = (DZQTokenV1 *)resModel.dataBody.firstObject.attributes;
        DZQLoginRelationV1 *userRelate = (DZQLoginRelationV1 *)resModel.dataBody.firstObject.relationships;
        
        [[DZMobileCtrl sharedCtrl] saveLoginUserData:resModel.oriRes_formart.data.firstObject andHandle:^{
            if (completion) {
                completion(userRelate.users.attributes,token,success);
            }
        }];
        
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,nil,NO);
        }
    }];
}

//// 重置密码
-(void)dzApiv3_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserV1 *varModel, BOOL success))completion{
    
    
    
}

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录(includeStr = groups,wechat )
/*
 include    string    否    关联数据，可选值：groups,wechat(只有当前登录用户可以使用) ,dialog
 */
-(void)dzApiv3_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQResV1 * varModel,BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure{
    
    NSString *includeStr = isMe ? @"wechat" : @"";
    [[DZQNetTool shared] DZQ_V3_UserInfoWithUserId:checkNull(userId) include:includeStr success:^(DZQResV1 * data, BOOL success) {
        if (completion) {
            completion(data,success);
        }
    } failure:^(DZQResError *error) {
        if (failure) {
            failure(error.errorBody.errors.firstObject);
        }
    }];
}


/// 用户搜索
/// @param userName 用户名：多个用户名用半角逗号隔开 用户名前或后加星号可使用模糊搜索
/*
 filter[id]    int    否    用户 id
 filter[username]    string    否    用户名：多个用户名用半角逗号隔开 用户名前或后加星号可使用模糊搜索
 filter[mobile]    string    否    用户手机号
 filter[status]    int    否    状态：normal 正常 ban 禁用 mod 审核中 through 审核通过 refuse 审核拒绝 ignore 审核忽略
 filter[group_id][]    array    否    用户组
 filter[isReal]    string    否    是否实名认证（yes/no）
 filter[wechat]    string    否    是否绑定微信（yes/no）
 page[limit]    int    否    分页数据条数
 page[number]    int    否    页码
 sort    string    否    排序：固定值 正序 createdAt 倒序 -createdAt
 include    string    否    关联数据，默认 groups
 */
-(void)dzApiv3_userSearcWithName:(NSString *)userName page:(NSInteger)page completion:(void (^)(DZQResV1 * varModel,BOOL success))completion{
    
    NSString *filterStr = [NSString stringWithFormat:@"filter[username]=%@&filter[status]=normal&include=groups&sort=createdAt&page[number]=%ld&page[limit]=20",checkNull(userName),(long)page];
    [[DZQNetTool shared] DZQ_V3_UserSearcWithFilter:filterStr page:page success:^(DZQResV1 * data, BOOL success) {
        if (completion) {
            completion(data,success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 消息列表
/*
 filter[type]    string    否    通知类型
 默认不传查全部
 
 system 系统通知
 replied 回复我的
 liked 点赞我的
 rewarded 支付我的
 related @我的
 withdrawal 提现通知
 questioned 问答通知    rewarded,withdrawal (逗号拼接,支持传多个)
 
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 */
-(void)dzApiv3_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion{
    
    NSString *query = [NSString stringWithFormat:@"&filter[type]=%@",checkNull(filter)];
    
    [[DZQNetTool shared] DZQ_V3_NotiListWithTypeQuery:query success:^(DZQResV1 *data, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataNotis = nil;// [DZNotiDataTool NotiResData:data.dataBody];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataNotis,data.hasMore,data.success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 通知消息删除
/// @param noti_id 消息id：12 或者 11,12,13
-(void)dzApiv3_notiDeleteWithNoti:(NSString * )noti_id completion:(void (^)(BOOL success))completion{
    
    noti_id = DZQStrNull(noti_id);
    if (!noti_id.length) {
        if (completion) { completion(NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_NotiDeleteWithTypeQuery:noti_id success:^(DZQResV1 *data, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            //            NSArray *dataNotis = [DZNotiDataTool NotiResData:data.dataBody];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data.success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(NO);
        }
    }];
}


/// 普通用户创建邀请码
-(void)dzApiv3_userinviteCodeWithSuccess:(void (^)(NSString * codeString))completion{
    
    [[DZQNetTool shared] DZQ_V3_UserinviteCodeWithSuccess:^(NSString * codeString, BOOL success) {
        if (completion) {
            completion(codeString);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil);
        }
    }];
    
}



/// 用户钱包 详情
/// @param user_id User_id
-(void)dzApiv3_userWalletInfoWithUser_id:(NSString *)user_id completion:(void (^)(DZQDataWallet *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    [[DZQNetTool shared] DZQ_V3_UserWalletInfoWithSubCtrl:user_id success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataWallet *data = nil;//(DZQDataWallet *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 提现记录列表
/// @param user_id User_id
/*
 排序参数    sort    否    string    可选值：created_at、updated_at。
 筛选参数    filter[cash_status]    否    int    筛选订单付款状态，可选值：1：待审核，2：审核通过，3：审核不通过，4：待打款， 5，已打款， 6：打款失败
 筛选参数    filter[user]    否    int    传递 user_id,筛选某用户数据
 筛选参数    filter[cash_sn]    否    string    按流水号筛选
 筛选参数    filter[username]    否    string    按提现申请人筛选
 筛选参数    filter[start_time]    否    datetime    按提现申请时间范围筛选：开始时间
 筛选参数    filter[end_time]    否    datetime    按提现申请时间范围筛选：最后时间
 可选值:user 用户信息、userWallet 用户钱包信息。
 */
-(void)dzApiv3_userWalletCashlistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQCashV1 *> *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    NSString *query = [NSString stringWithFormat:@"include=user,userWallet&sort=created_at&filter[user]=%@&page[number]=%ld&page[size]=20",user_id,page];
    
    [[DZQNetTool shared] DZQ_V3_UserWalletCashlistWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 钱包动账记录
/// @param user_id User_id
/*
 排序参数    sort    否    string    可选值：created_at、updated_at。
 关联参数    include    否    string    可选值:user 用户信息、userWallet 用户钱包信息、userWalletCash 提现记录信息、order 订单信息。
 筛选参数    filter[user]    否    int    传递 user_id,筛选某用户数据
 筛选参数    filter[change_type]    否    int    按变动类型筛选，10 提现冻结，11 提现成功，12 提现解冻，30 注册收入，31 打赏收入，32 人工收入，50 人工支出
 筛选参数    filter[change_desc]    否    sring    按描述筛选
 筛选参数    filter[username]    否    sring    按用户筛选
 筛选参数    filter[start_time]    否    datetime    按提创建时间范围筛选：开始时间
 筛选参数    filter[end_time]    否    datetime    按提创建时间范围筛选：最后时间
 */
-(void)dzApiv3_userWalletLoglistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataCashLog *> *varModel, BOOL hasMore,BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO,NO); }
        return;
    }
    
    NSString *inclueStr = @"include=user,userWallet,userWalletCash,order";
    NSString *query = [NSString stringWithFormat:@"%@&sort=created_at&filter[user]=%@&page[number]=%ld&page[size]=20",inclueStr,user_id,page];
    
    [[DZQNetTool shared] DZQ_V3_UserWalletLoglistWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZUserTool User_dataCashLogResData:resModel];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 提现申请
/// @param amount 提现金额为整数
-(void)dzApiv3_userWalletWithdrawWithAmount:(NSInteger)amount completion:(void (^)(DZQDataCash *dataCash, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_UserWalletWithdrawWithAmount:amount success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataCash *data = nil;//(DZQDataCash *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)dzApiv3_followShipCreateWithUser:(NSString *)to_user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    to_user_id = checkNull(to_user_id);
    if (!to_user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_FollowShipCreateWithUser:to_user_id success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataFollow *data = nil;//(DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 删除粉丝
/// @param user_id *被关注着 id
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzApiv3_fansShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    NSString *subCtrl = [NSString stringWithFormat:@"%@/%d",user_id,2];
    
    [[DZQNetTool shared] DZQ_V3_FollowShipDeleteWithSubCtrl:subCtrl success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataFollow *data = nil;//(DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 删除（取消）关注关系
/// @param user_id *被关注着 id
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzApiv3_followShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    NSString *subCtrl = [NSString stringWithFormat:@"%@/%d",user_id, 1];
    
    [[DZQNetTool shared] DZQ_V3_FollowShipDeleteWithSubCtrl:subCtrl success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataFollow *data = nil;//(DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 获取关注列表
/// @param user_id *用户id
/// @param isfan 是否是粉丝列表（我的粉丝 或 我的关注）
/*
 include    string    否    关联数据
 filter[type]    int    否    类型（1 我的关注 2 我的粉丝）
 filter[user_id]    int    否    用户 ID，不传默认获取当前登陆用户
 filter[username]    string    否    用户名模糊查询
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 
 */
-(void)dzApiv3_followShipListWithUser:(NSString *)user_id isfan:(BOOL)isfan page:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=toUser,fromUser,fromUser.groups,toUser.groups"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[type]=%d&filter[user_id]=%@&page[number]=%ld&page[limit]=20",includeStr,(isfan ? 2 : 1),user_id,(long)page];
    
    [[DZQNetTool shared] DZQ_V3_FollowShipListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *dataArray = nil;// [DZUserTool User_dataFollowResData:resModel];
        if (completion) {
            completion(dataArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}








/// 用户组 列表
/*
 include    string    否    关联数据
 filter[isDefault]    string    否    是否只返回默认用户组
 filter[isPaid]    int    否    传递 0 返回非付费用户组， 传递 1 返回付费用户组。
 filter[type]    string    否    传 invite 返回当前用户可见用户组（非管理员不返回游客、管理员用户组），前端用户组管理也可以使用次参数控制非管理员的展示内容
 #include 可关联的数据
 permission    permission    object    是    权限
 */
-(void)dzApiv3_userGroupListWithDefault:(BOOL)isDefault Paid:(BOOL)isPaid page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore, BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=permission"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[type]=invite&filter[isDefault]=%@filter[isPaid]=%d&page[number]=%ld&page[limit]=20",includeStr,(isDefault ? @"yes" : @"no"),(isPaid ? 1 : 0),page];
    
    [[DZQNetTool shared] DZQ_V3_UserGroupListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 修改用户头像
/// @param filaPath 头像文件
-(void)dzApiv3_userAvatarUploadWithUser:(NSString *)user_id file:(NSString *)filaPath progress:(PRProgressBlock)upProgress completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    NSString *subCtrl = [NSString stringWithFormat:@"%@/avatar",user_id];
    
    [[DZQNetTool shared] DZQ_V3_UserAvatarUploadWithSubCtrl:subCtrl file:filaPath progress:^(double Progress) {
        if (upProgress) {
            upProgress(Progress);
        }
    } success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 修改用户资料
-(void)dzApiv3_userInfoModifyWithUser:(NSString *)user_id paraDict:(NSDictionary *)paraDict completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    if (!paraDict.allValues.count) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_UserInfoModifyWithSubCtrl:user_id paraDict:paraDict success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


///  身份实名认证
/*
 identity    string    是    身份证号
 realname    string    是    姓名
 */
-(void)dzApiv3_userVerifyWithUser:(NSString *)realname identity:(NSString *)identity completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    identity = checkNull(identity);
    if (!identity.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_UserVerifyWithUser:realname identityNo:identity success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataUser *data = nil;//(DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 修改用户 支付密码
-(void)dzApiv3_userModifyPayPWDWithPayPwd:(NSString *)pay_password completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    pay_password = checkNull(pay_password);
    if (!pay_password.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_UserModifyPayPWDWithPayPwd:pay_password success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}



/// 用户订单 列表
/// @param user_id 用户id
/*
 排序参数    sort    否    string    可选值：created_at、updated_at。
 筛选参数    filter[status]    否    int    筛选订单付款状态，可选值：0 待付款，1 已付款，3 支付失败，4 订单已过期
 筛选参数    filter[user]    否    int    传递 user_id,筛选某用户数据
 筛选参数    filter[order_sn]    否    string    按订单号筛选
 筛选参数    filter[username]    否    string    按订单创建人筛选
 筛选参数    filter[payee_username]    否    string    按收款人用户名筛选
 筛选参数    filter[product]    否    string    按商品名筛选（帖子内容）
 筛选参数    filter[start_time]    否    datetime    按订单创建时间范围筛选：开始时间
 筛选参数    filter[end_time]    否    datetime    按订单创建时间范围筛选：最后时间
 关联参数    include    否    string    关联数据（包含 user，thread，thread.firstPost，group）
 */
-(void)dzApiv3_userOrderListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include="];
    NSString *query = [NSString stringWithFormat:@"%@&filter[user]=%@&page[number]=%ld&page[limit]=20",includeStr,user_id,page];
    
    [[DZQNetTool shared] DZQ_V3_UserOrderListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 查询订单（单条）
/// @param order_sn 订单唯一编号
-(void)dzApiv3_userOrderOneWithOrder:(NSString *)order_sn completion:(void (^)(DZQDataOrder *DataOrder,BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_UserOrderOneWithSubCtrl:order_sn success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataOrder *data = nil;//(DZQDataOrder *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 拉黑某个用户
-(void)dzApiv3_userCreateDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] DZQ_V3_UserCreateDenyWithSubCtrl:subCtrl success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataFollow *data = nil;//(DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 取消 拉黑某个用户
-(void)dzApiv3_userCancelDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] DZQ_V3_UserCancelDenyWithSubCtrl:subCtrl success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataFollow *data = nil;//(DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 某个用户 的拉黑用户列表
-(void)dzApiv3_userDenyListWithUser:(NSString *)user_id completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO,NO); }
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] DZQ_V3_UserDenyListWithSubCtrl:subCtrl success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}


#pragma mark   /********************* 消息 *************************/

/// 创建会话
-(void)dzApiv3_MsgDialogCreateWithUser:(NSString *)userName message:(NSString *)message completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    message = checkNull(message);
    if (!message.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    [[DZQNetTool shared] DZQ_V3_DialogCreateWithUserName:userName message:message success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 获取会话列表
/*
 include    string    否    关联数据
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 sort    string    否    默认按照创建时间倒序，可选值：最新消息编号dialogMessageId、创建时间createdAt。添加标记‘-’为倒序，如：‘-dialogMessageId’；
 
 #include 可关联的数据
 sender    users    object    否    发送人
 recipient    users    object    否    收信人
 sender.groups    groups    object    否    发送人用户组
 recipient.groups    groups    object    否    收信人用户组
 dialogMessage    dialog_message    object    否    最新消息
 */
-(void)dzApiv3_MsgDialogListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataDialog *> *dataDialogArr, BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=sender,recipient,sender.groups,recipient.groups,dialogMessage"];
    NSString *query = [NSString stringWithFormat:@"%@&sort=-createdAt&page[number]=%ld&page[limit]=20",includeStr,page];
    
    [[DZQNetTool shared] DZQ_V3_DialogListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *diaArray = nil;// [DZMsgDataTool dialogResData:resModel.dataBody];
        if (completion) {
            completion(diaArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}

/// 创建会话 消息
/*
 attributes    object    是    数据属性
 attributes. dialog_id    int    是    会话 ID
 attributes. message_text    string    是    消息内容，传消息内容时可以不传附件
 attributes. attachment_id    int    是    附件 ID，传附件时可以不传消息内容
 */
-(void)dzApiv3_MsgDialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_DialogMessageCreateWithMsg:message dialog_id:dialog_id attachment_id:attachment_id success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 获取会话消息列表
/*
 include    string    否    关联数据
 filter[dialog_id]    int    是    会话 ID
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 sort    string    否    创建时间正序createdAt，创建时间倒序-createdAt
 
 #include 可关联的数据
 attachment    attachments    object    是    附件（图片）
 user    users    object    否    用户
 user.groups    groups    object    否    用户组
 */
-(void)dzApiv3_MsgDialogMessageListWithDialog:(NSString *)dialog_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    dialog_id = checkNull(dialog_id);
    if (!dialog_id.length) {
        if (completion) { completion(nil,NO,NO); }
        return;
    }
    
    NSString *includeStr = [NSString stringWithFormat:@"include=attachment,user,user.groups"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[dialog_id]=%@&sort=createdAt&page[number]=%ld&page[limit]=20",includeStr,dialog_id,page];
    
    [[DZQNetTool shared] DZQ_V3_DialogMessageListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}



#pragma mark   /*************** Thread ***************/



/*
 user    users    object    是    发表用户
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 lastPostedUser    users    object    是    最后回复用户
 category    categories    object    是    主题分类
 */
/// 获取 特定分类 下主题列表
-(void)dzApiv3_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@",checkNull(cate_id)];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
}

/// 获取 特定分类 下主题列表 (是否精华 以及已关注)
-(void)dzApiv3_threadListWithSuperCate:(NSString *)cate_id morefilter:(NSString *)morefilter  page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@&%@",checkNull(cate_id),checkNull(morefilter)];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
}

/// 主题搜索（关键词） 列表
-(void)dzApiv3_threadListSearchWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[q]=%@",keyWord];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}

/// 获取 特定用户id 主题列表
-(void)dzApiv3_threadListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[userId]=%@",userId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 用户名搜索 主题列表
-(void)dzApiv3_threadListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[username]=%@",username];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 【 精华、置顶 】主题列表
/// @param isEssence 是否是精华
/// @param isSticky 是否是 置顶
-(void)dzApiv3_threadListWithEssence:(BOOL)isEssence isSticky:(BOOL)isSticky page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[isEssence]=%@&filter[isSticky]=%@",(isEssence ? @"yes" : @"no"),isSticky ? @"yes" : @"no"];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 某人 关注的 主题列表（会验证是否为当前登录用户）
-(void)dzApiv3_threadListWithFollowUser:(NSString *)fromUserId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[fromUserId]=%@",fromUserId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 特定类型的 主题列表 （0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖）
-(void)dzApiv3_threadListWithType:(NSInteger)type page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[type]=%ld",(long)type];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 特定话题 的 主题列表
-(void)dzApiv3_threadListWithTopic:(NSString *)topicId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[topicId]=%@",topicId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}

///  查询主题[列表]
-(void)inner_threadListfilterWithfilter:(NSString *)filter page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    page = (page <= 0) ? 1 : page;
    NSString *defaultStr = @"user,firstPost,category,threadVideo,threadAudio,question,firstPost.postGoods,lastPostedUser";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,deletedUser,firstPost.images,firstPost.likedUsers,lastThreePosts,lastThreePosts.user,lastThreePosts.replyUser,rewardedUsers,paidUsers,topic,question.beUser",defaultStr];
    NSString *query = [NSString stringWithFormat:@"%@&filter[isApproved]=1&filter[isDisplay]=yes&filter[isDeleted]=no&%@&page[number]=%ld&page[limit]=20",filter,includeStr,(long)page];
    
    [[DZQNetTool shared] DZQ_V3_ThreadListWithQuery:query success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

-(void)dzApiv3_threadOneWithThreadId:(NSString *)thread_id completion:(void (^)(DZQThreadV3 *threadData,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,threadAudio,category,posts,question,rewardedUsers,paidUsers";
    NSString *includeStr = @"user.groups,posts.user,posts.thread,posts.images,posts.replyUser,posts.likedUsers,firstPost.likedUsers,firstPost.images,firstPost.attachments,question.beUser,question.images,onlookers";
    
    [self innerV3_threadOne_ThreadId:thread_id defaultStr:defaultStr include:includeStr completion:completion];
}

/*
 /// 获取 单一主题详细信息
 user    users    object    是    主题作者
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 firstPost.images    attachments    array    是    首贴图片
 firstPost.attachments    attachments    array    是    首贴附件
 firstPost.postGoods    post_goods    object    否    商品信息
 posts    posts    array    是    回复列表
 posts.user    users    object    是    回复的作者
 posts.commentUser    users    object    是    回复评论的关联用户
 posts.thread    threads    object    是    回复所在的主题即当前主题
 posts.images    attachments    array    是    回复的图片
 user.groups    groups    object    否    用户所在群组
 category    categories    object    否    主题分类
 firstPost.likedUsers    users    array    否    点赞首贴的用户
 posts.likedUsers    users    array    否    点赞回复的用户
 rewardedUsers    users    array    否    打赏主题的用户
 paidUsers    users    array    否    付费主题的已购用户
 firstPost.mentionUsers    users    array    否    主题@用户
 posts.mentionUsers    users    array    否    回复@用户
 user.groups.permissionWithoutCategories    permission    array    否    查询用户除了分类的权限列表
 question    question    object    否    查询问答信息
 question.beUser    question    object    否    查询被提问人用户信息
 question.images    question    array    否    查询回答的图片内容
 onlookers    users    array    否    查询围观人（非提问者 但是付费查看的人）
 */
-(void)innerV3_threadOne_ThreadId:(NSString *)thread_id defaultStr:(NSString *)defaultStr include:(NSString *)includeStr completion:(void (^)(DZQThreadV3 *threadData,BOOL success))completion{
    
    NSString *queryStr = [NSString stringWithFormat:@"include=%@,%@",defaultStr,includeStr];
    [[DZQNetTool shared] DZQ_V3_ThreadOneWithSubCtrl:thread_id query:queryStr success:^(DZQResV3 *resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = resModel.resData;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray.firstObject,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}






/// 分享主题时获取主题信息接口[单条]
/*
 user    users    object    是    发表用户
 firstPost    posts    object    是    首帖
 
 firstPost.images    attachments    array    否    首贴图片
 firstPost.attachments    attachments    array    否    首贴附件
 firstPost.likedUsers    users    array    否    点赞首贴的用户
 rewardedUsers    users    array    否    打赏主题的用户(⚠️字段异常)
 category    categories    object    否    主题分类
 #请求示例
 */
-(void)dzApiv3_threadShareWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *dataThread,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost";
    NSString *query = [NSString stringWithFormat:@"include=%@,firstPost.images,firstPost.attachments,firstPost.likedUsers,category",defaultStr];
    
    [[DZQNetTool shared] DZQ_V3_ThreadShareWithSubCtrl:thread_id query:query success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            DZQDataThread *daThread = nil;// [DZHomeTool thead_shareDataThreadResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion && resModel.success) {
                    completion(daThread,resModel.success);
                }else{
                    if (completion) {
                        completion(nil,NO);
                    }
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}



/// 收藏 主题 列表
/*
 include 可关联的数据:
 
 user    users    object    是    发表用户
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 lastPostedUser    users    object    是    最后回复用户
 category    categories    object    是    主题分类
 
 user.groups    groups    object    否    用户所在群组
 deletedUser    users    object    否    删除用户
 firstPost.images    attachments    array    否    首贴图片
 firstPost.likedUsers    users    array    否    点赞首帖的用户
 lastThreePosts    posts    array    否    最后三条回复
 lastThreePosts.user    users    object    否    最后三条回复的作者
 lastThreePosts.replyUser    users    object    否    最后三条回复所回复的用户
 rewardedUsers    users    array    否    打赏主题的用户
 lastDeletedLog    operation-logs    object    否    最后一次被删除的操作日志
 */

-(void)dzApiv3_threadFavoriteListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,lastPostedUser,category";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,deletedUser,firstPost.images,firstPost.likedUsers,lastThreePosts,lastThreePosts.user,lastThreePosts.replyUser,rewardedUsers",defaultStr];
    NSString *queryStr = [NSString stringWithFormat:@"filter[user_id]=%@&%@&page[number]=%ld&page[limit]=20",user_id,includeStr,(long)page];
    
    [[DZQNetTool shared] DZQ_V3_ThreadFavoriteListWithQuery:queryStr success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}




/// 用户 点赞 主题列表
/*
 
 include    string    否    关联数据
 filter[user_id]    int    是    用户 ID
 
 include 可关联的数据:
 
 user    users    object    是    发表用户
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 category    categories    object    是    主题分类
 user.groups    groups    object    否    用户所在群组
 firstPost.images    attachments    array    否    首贴图片
 firstPost.likedUsers    users    array    否    点赞首帖的用户
 */

-(void)dzApiv3_thread_UserlikeListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,category";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,firstPost.images,firstPost.likedUsers",defaultStr];
    NSString *queryStr = [NSString stringWithFormat:@"filter[user_id]=%@&%@&page[limit]=20&page[number]=%ld",user_id,includeStr,page];
    
    [[DZQNetTool shared] DZQ_V3_Thread_UserlikeListWithQuery:queryStr success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}


/// 查询我点赞的 评论回复 接口[列表]
-(void)dzApiv3_PostLikedListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = @"include=user,thread";
    NSString *queryStr = [NSString stringWithFormat:@"%@&page[number]=%ld&page[limit]=20",includeStr,page];
    
    [[DZQNetTool shared] DZQ_V3_PostLikeListWithQuery:queryStr success:^(DZQResV1 * resModel, BOOL success) {
        dispatch_async(self.formatter.formartQueue, ^{
            NSArray *dataArray = nil;// [DZHomeTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

///// 删除主题
-(void)dzApiv3_threadDeleteWithThread:(NSString *)thread_id completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_ThreadDeleteWithSubCtrl:thread_id success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}

#pragma mark ====  【【【【 主题的创建 - 普通，长文，图片 视频，问答，语音，商品 】】】】相关操作

///// 创建视频主题（回调）
/*
 file_id    string    是    视频上传后返回的 file_id
 file_name    string    否    视频文件名称
 */
-(void)dzApiv3_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_ThreadCreateVideoWithFile:file_id file_name:file_name success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
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
-(void)dzApiv3_threadPublishWithPara:(DZThreadDraftM *)threadpPara captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure{
    
    NSDictionary *parameters = [threadpPara parameterToSendThreadWithCaptcha:captcha];
    
    [[DZQNetTool shared] DZQ_V3_ThreadCreateWithPara:parameters success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (failure) {
            failure(error.errorBody.errors.firstObject);
        }
    }];
    
}



/// 创建云点播前端上传签名
-(void)dzApiv3_thread_UploadSignatureWithCompletion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_ThreadUploadSignatureWithSuccess:^(DZQResV1 * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}

#pragma mark ====  【【【【 主题的修改 - 置顶，加精，收藏 修改分类，修改内容 】】】】相关操作

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
 {
 "data": {
 "type": "threads",
 "attributes": {
 "isApproved": false,
 "isSticky": true,
 "isEssence": true,
 "isDeleted": true,
 "price": "2.00",
 "title": "666",
 "file_name": "666",
 "file_id": "666",
 "message": "文章内容不合法"
 },
 
 "relationships": {
 "category": {
 "data": {
 "type": "categories",
 "id": 4
 }
 }
 }
 }
 }
 
 */

//// 加精 主题
-(void)dzApiv3_threadEssenceWithThread:(NSString *)thread_id isEssence:(BOOL)isEssence completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isEssence":@(isEssence),@"message":@"iOS_SDK_主题加精"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 置顶 主题
-(void)dzApiv3_threadStickyWithThread:(NSString *)thread_id isSticky:(BOOL)isSticky completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isSticky":@(isSticky),@"message":@"iOS_SDK_主题置顶"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 删除 主题
-(void)dzApiv3_threadDeleteWithThread:(NSString *)thread_id isDeleted:(BOOL)isDeleted completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isDeleted":@(isDeleted),@"message":@"iOS_SDK_主题删除"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 收藏 主题
-(void)dzApiv3_threadFavoriteWithThread:(NSString *)thread_id isFavorite:(BOOL)isFavorite completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isFavorite":@(isFavorite),@"message":@"iOS_SDK_主题收藏"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 修改分类
-(void)dzApiv3_threadResetCateWithThread:(NSString *)thread_id cate:(NSString *)cate_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *attDataDict = @{@"message":@"iOS_SDK_修改分类"};
    NSDictionary *dataDict = @{@"id":DZQStrNull(cate_id),@"type":@"categories"};
    NSDictionary *cateDataDict = @{@"data":dataDict};
    NSDictionary *relationDict = @{@"category":cateDataDict};
    NSDictionary *attributes = @{@"attributes":attDataDict,@"type":@"threads",@"relationships":relationDict};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

///// 修改主题内容
-(void)inner_threadResetWithThread:(NSString *)thread_id paraDict:(NSDictionary *)paraDict completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] DZQ_V3_ThreadResetWithSubCtrl:thread_id paraDict:paraDict success:^(DZQResV1 * resModel, BOOL success) {
        DZQDataThread *data = (DZQDataThread *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(DZQResError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}



@end
