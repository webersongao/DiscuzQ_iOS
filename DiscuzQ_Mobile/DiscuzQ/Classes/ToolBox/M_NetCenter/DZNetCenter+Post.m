//
//  DZNetCenter+Post.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Post.h"
#import "DZDiscoverTool.h"
#import "DZThreadListStyle.h"
#import "DZThreadDetailStyle.h"

@implementation DZNetCenter (Post)


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
 
 #include 可关联的数据
 
 user    users    object    是    发表用户
 replyUser    users    object    是    所回复的用户
 images    attachments    array    是    回复下的图片
 thread    threads    object    是    所属主题
 user.groups    groups    object    否    用户所在群组
 thread.category    categories    object    否    所属主题的分类
 thread.firstPost    posts    object    否    所属主题的首贴
 lastThreeComments    posts    object    否    最后三条评论
 lastThreeComments.user    posts    object    否    最后三条评论的作者
 lastThreeComments.replyUser    posts    object    否    最后三条评论所回复的用户
 deletedUser    users    object    否    删除用户
 lastDeletedLog    operation-logs    object    否    最后一次被删除的操作日志
 */

/// 查询 特定主题 回复 接口[列表]
-(void)dzx_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[thread]=%@",thread_id];
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 特定关键字 回复 接口[列表]
-(void)dzx_PostListWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[q]=%@",keyWord];
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 特定用户 回复 接口[列表]
-(void)dzx_PostListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[userId]=%@",userId];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定 用户名 回复 接口[列表]
-(void)dzx_PostListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[username]=%@",username];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定分类下 回复 接口[列表]
-(void)dzx_PostListWithCate:(NSString *)categoryId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[categoryId]=%@",categoryId];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}


/// 查询 特定回复 的二级回复接口[列表]
-(void)dzx_PostListWithReply:(NSString *)reply_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    NSString *filter = [NSString stringWithFormat:@"filter[reply]=%@&filter[isComment]=yes",reply_id];
    
    [self inner_PostListFilterWithfilter:filter page:page completion:completion];
}

/// 查询 回复 接口[列表]
-(void)inner_PostListFilterWithfilter:(NSString *)filter page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    page = (page <= 0) ? 1 : page;
    NSString *defaultStr = @"user,replyUser,images,thread";
    NSString *query = [NSString stringWithFormat:@"%@&filter[isApproved]=1&filter[isDeleted]=no&include=%@&page[number]=%ld&page[limit]=20",filter,defaultStr,(long)page];
    
    [[DZQNetTool shared] dz_PostListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
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
    } failure:^(NSError *error) {
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
-(void)dzx_attachmentUploadWithFile:(NSString *)filePath isGallery:(NSInteger)isGallery isSound:(NSInteger)isSound progress:(void (^)(double progress))backProgress completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *queryStr = [NSString stringWithFormat:@"isGallery=%ld&isSound=%ld",isGallery,isSound];
    
    [[DZQNetTool shared] dz_attachmentUploadWithQuery:queryStr file:filePath success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = nil; //[DZDiscoverTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
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
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}


/// 删除 附件
-(void)dzx_attachmentDeleteWithUUid:(NSString *)uuid completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    [[DZQNetTool shared] dz_attachmentDeleteWithSubCtrl:uuid success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}
    
    

/// 创建举报数据(主题 或 回复)
/*
 user_id    int    是    用户ID    举报人的用户ID
 thread_id    int    否    主题ID    举报[主题/回复内容]都会传输
 post_id    int    否    回复ID    如果举报的主题则不需要传输该ID
 type    int    是    举报类型    0个人主页 1主题 2评论/回复
 reason    string    是    举报理由    必传举报理由
 */
-(void)dzx_threadOrPostReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason type:(NSInteger)type completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSDictionary *paraDict = @{@"user_id":checkNull(user_id),
                               @"thread_id":checkNull(thread_id),
                               @"post_id":checkNull(post_id),
                               @"reason":checkNull(reason),
                               @"type":@(type)
    };
    [[DZQNetTool shared] dz_threadOrPostReportWithPara:paraDict success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = nil;// [DZDiscoverTool post_dataPostResData:resModel style:[DZDPostCellStyle class]];
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
-(void)dzx_TopicListOfThreadWithKey:(NSString *)content username:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = @"include=user,lastThread,lastThread.firstPost,lastThread.firstPost.images";
    NSString *queryStr = [NSString stringWithFormat:@"%@&filter[content]=%@&filter[username]=%@&sort=page[number]=%ld&page[limit]=20",includeStr,content,username,page];
    
    [[DZQNetTool shared] dz_TopicListOfThreadWithQuery:queryStr success:^(DZQResModel * resModel, BOOL success) {
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


/// 查询话题接口[单条]
/// @param topic_id 话题Id
-(void)dzx_TopicOneOfThreadWithTopic:(NSString *)topic_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    topic_id = checkNull(topic_id);
    if (!topic_id.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_TopicOneOfThreadWithSubCtrl:topic_id success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 创建回复
-(void)dzx_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    content = checkNull(content);
    if (!content.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_PostCreateWithThread:threadId replyId:replyId content:content isComment:isComment success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 删除回复
-(void)dzx_PostDeleteWithPost:(NSString *)comment_id isComment:(BOOL)isComment completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    comment_id = checkNull(comment_id);
    if (!comment_id.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_PostDeleteWithSubCtrl:comment_id success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(NSError *error) {
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
-(void)dzx_PostIgnoreWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isApproved":@(2)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 删除
-(void)dzx_PostDeleteWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isDeleted":@(1)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 喜欢
-(void)dzx_PostLikeOrNotWithSubCtrl:(NSString *)comment_id isLiked:(BOOL)isLiked completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    NSDictionary *dataDict = @{@"isLiked":@(isLiked)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复 -- 修改内容
-(void)dzx_PostResetContentWithSubCtrl:(NSString *)comment_id Content:(NSString *)content completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    // 增加 content 即可修改回复内容，但是目前不给用户修改的机会
    NSDictionary *dataDict = @{@"content":DZQStrNull(content)};
    [self inner_PostResetWithPost:comment_id dataDict:dataDict completion:completion];
}

/// 修改回复
-(void)inner_PostResetWithPost:(NSString *)comment_id dataDict:(NSDictionary *)dataDict completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    [[DZQNetTool shared] dz_PostResetWithSubCtrl:comment_id dataDict:dataDict success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            DZQDataTopic *data = (DZQDataTopic *)resModel.dataBody.firstObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

@end
