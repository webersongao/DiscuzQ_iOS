//
//  DZNetCenter+Thread.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Thread.h"
#import "DZDiscoverTool.h"
#import "DZThreadListStyle.h"
#import "DZThreadDetailStyle.h"


@implementation DZNetCenter (Thread)

/*
 
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
 paidUsers    users    array    否    付费主题的已购用户
 lastDeletedLog    operation-logs    object    否    最后一次被删除的操作日志
 topic    topics    object    否    主题话题
 
 🖐 筛选项：
 filter[q]    string    否    关键词
 filter[userId]    int    否    作者 id
 filter[username]    string    否    作者用户名
 filter[categoryId]    int    否    分类 id
 filter[createdAtBegin]    datetime    否    发表时间大于
 filter[createdAtEnd]    datetime    否    发表时间小于
 filter[viewCountGt]    int    否    浏览次数大于
 filter[viewCountLt]    int    否    浏览次数小于
 filter[postCountGt]    int    否    回复数大于
 filter[postCountLt]    int    否    回复数小于
 filter[isEssence]    string    否    是否精华（yes/no）
 filter[isSticky]    string    否    是否置顶（yes/no）
 filter[isApproved]    string    否    是否合法（0/1/2） 0 不合法 1 正常 2 忽略
 filter[isDeleted]    string    否    是否删除（yes/no）
 filter[likedLimit]    int    否    点赞首帖的用户返回数量
 filter[rewardedLimit]    int    否    打赏主题的用户返回数量
 filter[paidLimit]    int    否    付费主题的已购用户返回数量
 filter[highlight]    string    否    是否高亮敏感词（yes/no）
 filter[fromUserId]    int    否    关注人 userId（会验证是否为当前登录用户）
 filter[type]    int    否    类型：0 普通 1 长文 2 视频 3 图片
 filter[topicId]    int    否    话题ID
 
 */
/// 获取 特定分类 下主题列表
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@",checkNull(cate_id)];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
}

/// 获取 特定分类 下主题列表 (是否精华 以及已关注)
-(void)dzx_threadListWithSuperCate:(NSString *)cate_id morefilter:(NSString *)morefilter  page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@&%@",checkNull(cate_id),checkNull(morefilter)];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
}

/// 主题搜索（关键词） 列表
-(void)dzx_threadListSearchWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[q]=%@",keyWord];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}

/// 获取 特定用户id 主题列表
-(void)dzx_threadListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[userId]=%@",userId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 用户名搜索 主题列表
-(void)dzx_threadListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[username]=%@",username];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 【 精华、置顶 】主题列表
/// @param isEssence 是否是精华
/// @param isSticky 是否是 置顶
-(void)dzx_threadListWithEssence:(BOOL)isEssence isSticky:(BOOL)isSticky page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[isEssence]=%@&filter[isSticky]=%@",(isEssence ? @"yes" : @"no"),isSticky ? @"yes" : @"no"];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 某人 关注的 主题列表（会验证是否为当前登录用户）
-(void)dzx_threadListWithFollowUser:(NSString *)fromUserId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[fromUserId]=%@",fromUserId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 特定类型的 主题列表 （0 普通 1 长文 2 视频 3 图片）
-(void)dzx_threadListWithType:(NSInteger)type page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[type]=%ld",(long)type];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}


/// 获取 特定话题 的 主题列表
-(void)dzx_threadListWithTopic:(NSString *)topicId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[topicId]=%@",topicId];
    [self inner_threadListfilterWithfilter:filter page:page completion:completion];
    
}

///  查询主题[列表]
-(void)inner_threadListfilterWithfilter:(NSString *)filter page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    page = (page <= 0) ? 1 : page;
    
    NSString *defaultStr = @"user,firstPost,threadVideo,lastPostedUser,category";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,deletedUser,firstPost.images,firstPost.likedUsers,lastThreePosts,lastThreePosts.user,lastThreePosts.replyUser,rewardedUsers,paidUsers,topic",defaultStr];
    NSString *query = [NSString stringWithFormat:@"%@&filter[isApproved]=1&filter[isDeleted]=no&%@&page[number]=%ld&page[limit]=20",filter,includeStr,(long)page];
    
    [[DZQNetTool shared] dz_threadListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}



/*
 /// 获取 单一主题详细信息
 user    users    object    是    主题作者
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 firstPost.images    attachments    array    是    首贴图片
 firstPost.attachments    attachments    array    是    首贴附件
 posts    posts    array    是    回复列表
 posts.user    users    object    是    回复的作者
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
 */
-(void)dzx_threadOneWithThreadId:(NSString *)thread_id completion:(void (^)(DZQDataThread *threadData,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,firstPost.images,firstPost.attachments,posts,posts.user,posts.thread,posts.images";
    NSString *query = [NSString stringWithFormat:@"include=%@,category,firstPost.likedUsers,rewardedUsers,paidUsers",defaultStr];
    [[DZQNetTool shared] dz_threadOneWithSubCtrl:thread_id query:query success:^(DZQResModel *resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool thead_dataThreadResData:resModel style:[DZThreadDetailStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray.firstObject,success);
                }
            });
        });
    } failure:^(NSError *error) {
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
-(void)dzx_threadShareWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *dataThread,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost";
    NSString *query = [NSString stringWithFormat:@"include=%@,firstPost.images,firstPost.attachments,firstPost.likedUsers,category",defaultStr];
    
    [[DZQNetTool shared] dz_threadShareWithSubCtrl:thread_id query:query success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataThread *daThread = [DZDiscoverTool thead_shareDataThreadResData:resModel style:[DZDPostCellStyle class]];
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
    } failure:^(NSError *error) {
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

-(void)dzx_threadFavoriteListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,lastPostedUser,category";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,deletedUser,firstPost.images,firstPost.likedUsers,lastThreePosts,lastThreePosts.user,lastThreePosts.replyUser,rewardedUsers",defaultStr];
    NSString *queryStr = [NSString stringWithFormat:@"filter[user_id]=%@&%@&page[number]=%ld&page[limit]=20",user_id,includeStr,(long)page];
    
    [[DZQNetTool shared] dz_threadFavoriteListWithQuery:queryStr success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(NSError *error) {
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

-(void)dzx_thread_UserlikeListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,category";
    NSString *includeStr = [NSString stringWithFormat:@"include=%@,user.groups,firstPost.images,firstPost.likedUsers",defaultStr];
    NSString *queryStr = [NSString stringWithFormat:@"filter[user_id]=%@&%@&page[limit]=20&page[number]=%ld",user_id,includeStr,page];
    
    [[DZQNetTool shared] dz_thread_UserlikeListWithQuery:queryStr success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool thead_dataThreadResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}


/// 查询我点赞的 评论回复 接口[列表]
-(void)dzx_PostLikedListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = @"include=user,thread";
    NSString *queryStr = [NSString stringWithFormat:@"%@&page[number]=%ld&page[limit]=20",includeStr,page];
    
    [[DZQNetTool shared] dz_PostLikeListWithQuery:queryStr success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
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
-(void)dzx_threadCreateWithPara:(NSDictionary *)parameters completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    /*
     {
     "data": {
     "type": "threads",
     "attributes": {
     "price": 10,
     "title": "title",
     "is_long_article": true,
     "content": "{{$randomWords}} == {{$randomColor}} == {{$randomWords}}"
     },
     "relationships": {
     "category": {
     "data": {
     "type": "categories",
     "id": 6
     }
     },
     "attachments": {
     "data": [
     {
     "type": "attachments",
     "id": 1
     },
     {
     "type": "attachments",
     "id": 2
     }
     ]
     }
     }
     }
     }
     */
    
    [[DZQNetTool shared] dz_threadCreateWithPara:nil success:^(DZQResModel * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

///// 创建视频主题（回调）
/*
 file_id    string    是    视频上传后返回的 file_id
 file_name    string    否    视频文件名称
 */
-(void)dzx_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_threadCreateVideoWithFile:file_id file_name:file_name success:^(DZQResModel * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


///// 删除主题
-(void)dzx_threadDeleteWithThread:(NSString *)thread_id completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_threadDeleteWithSubCtrl:thread_id success:^(DZQResModel * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 创建云点播前端上传签名
-(void)dzx_thread_UploadSignatureWithCompletion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_thread_UploadSignatureWithSuccess:^(DZQResModel * resModel, BOOL success) {
        DZQDataUser *data = (DZQDataUser *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}



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
-(void)dzx_threadResetEssenceWithThread:(NSString *)thread_id isEssence:(BOOL)isEssence completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isEssence":@(isEssence),@"message":@"iOS_SDK_主题加精"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 置顶 主题
-(void)dzx_threadResetStickyWithThread:(NSString *)thread_id isSticky:(BOOL)isSticky completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isSticky":@(isSticky),@"message":@"iOS_SDK_主题置顶"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 删除 主题
-(void)dzx_threadResetDeleteWithThread:(NSString *)thread_id isDeleted:(BOOL)isDeleted completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isDeleted":@(isDeleted),@"message":@"iOS_SDK_主题删除"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 收藏 主题
-(void)dzx_threadResetFavoriteWithThread:(NSString *)thread_id isFavorite:(BOOL)isFavorite completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isFavorite":@(isFavorite),@"message":@"iOS_SDK_主题收藏"};
    NSDictionary *attributes = @{@"attributes":dataDict,@"type":@"threads"};
    NSDictionary *paraDict = @{@"data":attributes};
    
    [self inner_threadResetWithThread:thread_id paraDict:paraDict completion:completion];
}

//// 修改分类
-(void)dzx_threadResetCateWithThread:(NSString *)thread_id cate:(NSString *)cate_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
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
    
    [[DZQNetTool shared] dz_threadResetWithSubCtrl:thread_id paraDict:nil success:^(DZQResModel * resModel, BOOL success) {
        DZQDataThread *data = (DZQDataThread *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}




@end
