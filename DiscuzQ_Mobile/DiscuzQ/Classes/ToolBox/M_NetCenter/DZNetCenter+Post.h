//
//  DZNetCenter+Post.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZQTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Post)
 

/// 查询 特定主题 回复 接口[列表]
-(void)dzx_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;

/// 查询 特定关键字 回复 接口[列表]
-(void)dzx_PostListWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;

/// 查询 特定用户 回复 接口[列表]
-(void)dzx_PostListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定 用户名 回复 接口[列表]
-(void)dzx_PostListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定分类下 回复 接口[列表]
-(void)dzx_PostListWithCate:(NSString *)categoryId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定回复 的二级回复接口[列表]
-(void)dzx_PostListWithReply:(NSString *)reply_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// ❤️上传附件
-(void)dzx_attachmentUploadWithFile:(NSString *)filePath isGallery:(NSInteger)isGallery isSound:(NSInteger)isSound progress:(void (^)(double progress))backProgress completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️删除 附件
-(void)dzx_attachmentDeleteWithUUid:(NSString *)uuid completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;


/// ❤️创建举报数据(主题 或 回复)
-(void)dzx_threadOrPostReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason type:(NSInteger)type completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;


/// ❤️获取话题列表
/// @param content 话题内容（模糊查询）
/// @param username 话题作者
-(void)dzx_TopicListOfThreadWithKey:(NSString *)content username:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;


/// 查询话题接口[单条]
/// @param topic_id 话题Id
-(void)dzx_TopicOneOfThreadWithTopic:(NSString *)topic_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;


/// ❤️创建回复
-(void)dzx_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

/// ❤️删除回复
-(void)dzx_PostDeleteWithPost:(NSString *)comment_id isComment:(BOOL)isComment completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

/// ❤️修改回复 -- 忽略
-(void)dzx_PostIgnoreWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

/// ❤️修改回复 -- 删除
-(void)dzx_PostDeleteWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

/// ❤️修改回复 -- 喜欢
-(void)dzx_PostLikeOrNotWithSubCtrl:(NSString *)comment_id isLiked:(BOOL)isLiked completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

/// ❤️修改回复 -- 修改内容
-(void)dzx_PostResetContentWithSubCtrl:(NSString *)comment_id Content:(NSString *)content completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;

@end

NS_ASSUME_NONNULL_END
