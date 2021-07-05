//
//  DZNetCenter+Post.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Post.h"
#import "DZNetCenter+API_V1_0.h"
#import "DZNetCenter+API_V3_0.h"
#import "DZNetFormatter+Adapter.h"

@implementation DZNetCenter (Post)

/// 查询 特定主题 回复 接口[列表]
-(void)dzx_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithThreadId:thread_id page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
    
}

/// 查询 特定关键字 回复 接口[列表]
-(void)dzx_PostListWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithKey:keyWord page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
}

/// 查询 特定用户 回复 接口[列表]
-(void)dzx_PostListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithUser:userId page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
    
}


/// 查询 特定 用户名 回复 接口[列表]
-(void)dzx_PostListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithUserName:username page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
}


/// 查询 特定分类下 回复 接口[列表]
-(void)dzx_PostListWithCate:(NSString *)categoryId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithCate:categoryId page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
}


/// 查询 特定回复 的二级回复接口[列表]
-(void)dzx_PostListWithReply:(NSString *)reply_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostListWithReply:reply_id page:page completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
            if (completion) {
                completion(postArr,hasMore);
            }
        }];
    }
    
}




/// 上传附件
-(void)dzx_attachmentUploadWithFile:(NSString *)filePath isGallery:(NSInteger)isGallery isSound:(NSInteger)isSound progress:(void (^)(double progress))backProgress completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_attachmentUploadWithFile:filePath isGallery:isGallery isSound:isSound progress:backProgress completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 删除 附件
-(void)dzx_attachmentDeleteWithUUid:(NSString *)uuid completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_attachmentDeleteWithUUid:uuid completion:^(DZQDataTopic * _Nonnull dataTopic, BOOL success) {
            if (completion) {
                completion(dataTopic,success);
            }
        }];
    }
}


///  举报——回复
-(void)dzx_postReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_postReportWithUser:user_id thread:thread_id post:post_id reason:reason completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

///  举报——主题
-(void)dzx_threadReportWithUser:(NSString *)user_id thread:(NSString *)thread_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadReportWithUser:user_id thread:thread_id reason:reason completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}






/// 获取话题列表
/// @param content 话题内容（模糊查询）
/// @param username 话题作者
-(void)dzx_TopicListOfThreadWithKey:(NSString *)content username:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_TopicListOfThreadWithKey:content username:username page:page completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 查询话题接口[单条]
/// @param topic_id 话题Id
-(void)dzx_TopicOneOfThreadWithTopic:(NSString *)topic_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion{
    
    topic_id = checkNull(topic_id);
    if (!topic_id.length) {
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_TopicOneOfThreadWithTopic:topic_id completion:^(DZQDataTopic * _Nonnull dataTopic, BOOL success) {
            if (completion) {
                completion(dataTopic,success);
            }
        }];
    }
}


/// 创建回复
-(void)dzx_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    content = checkNull(content);
    if (!content.length) {
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostCreateWithThread:threadId replyId:replyId content:content isComment:isComment completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
    
}

/// 删除回复
-(void)dzx_PostDeleteWithPost:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    comment_id = checkNull(comment_id);
    if (!comment_id.length) {
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostDeleteWithPost:comment_id completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
}


/// 修改回复 -- 忽略
-(void)dzx_PostIgnoreWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostIgnoreWithSubCtrl:comment_id completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
}

/// 修改回复 -- 删除
-(void)dzx_PostDeleteWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostDeleteWithSubCtrl:comment_id completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
}

/// 修改回复 -- 喜欢
-(void)dzx_PostLikeOrNotWithPost:(NSString *)Post_id isLiked:(BOOL)isLiked completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostLikeOrNotWithPost:Post_id isLiked:isLiked completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
}

/// 修改回复 -- 修改内容
-(void)dzx_PostResetContentWithSubCtrl:(NSString *)comment_id Content:(NSString *)content completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostResetContentWithSubCtrl:comment_id Content:content completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
            if (completion) {
                completion(dataPost,success);
            }
        }];
    }
}


@end
