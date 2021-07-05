//
//  DZNetCenter+Thread.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZThreadDraftM.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Thread)

/// 获取 特定分类 下主题列表
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 获取 特定分类 下主题列表 (是否精华 以及已关注)
-(void)dzx_threadListWithSuperCate:(NSString *)cate_id morefilter:(NSString *)morefilter  page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 主题搜索（关键词） 列表
-(void)dzx_threadListSearchWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 获取 特定用户id 主题列表
-(void)dzx_threadListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 用户名搜索 主题列表
-(void)dzx_threadListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 【 精华、置顶 】主题列表
/// @param isEssence 是否是精华
/// @param isSticky 是否是 置顶
-(void)dzx_threadListWithEssence:(BOOL)isEssence isSticky:(BOOL)isSticky page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;



/// 某人 关注的 主题列表（会验证是否为当前登录用户）
-(void)dzx_threadListWithFollowUser:(NSString *)fromUserId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 特定类型的 主题列表 （0 普通 1 长文 2 视频 3 图片）
-(void)dzx_threadListWithType:(NSInteger)type page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 特定话题 的 主题列表
-(void)dzx_threadListWithTopic:(NSString *)topicId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 单一主题详细信息
-(void)dzx_threadOneWithThreadId:(NSString *)thread_id completion:(void (^)(DZQDataThread *threadData,BOOL success))completion;

/// 分享主题时获取主题信息接口[单条]
-(void)dzx_threadShareWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *dataThread,BOOL success))completion;

/// 收藏 主题 列表
-(void)dzx_threadFavoriteListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 用户 点赞 主题列表
-(void)dzx_thread_UserlikeListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️查询我点赞的 评论回复 接口[列表]
-(void)dzx_PostLikedListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️创建云点播前端上传签名
-(void)dzx_thread_UploadSignatureWithCompletion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️创建主题接口
-(void)dzx_threadPublishWithPara:(DZThreadDraftM *)threadpPara captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure;

/// ❤️删除主题
-(void)dzx_threadDeleteWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️创建视频主题（回调）
-(void)dzx_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name completion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️加精 主题
-(void)dzx_threadEssenceWithThread:(NSString *)thread_id isEssence:(BOOL)isEssence completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️置顶 主题
-(void)dzx_threadStickyWithThread:(NSString *)thread_id isSticky:(BOOL)isSticky completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️收藏 主题
-(void)dzx_threadFavoriteWithThread:(NSString *)thread_id isFavorite:(BOOL)isFavorite completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️修改分类
-(void)dzx_threadResetCateWithThread:(NSString *)thread_id cate:(NSString *)cate_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;




@end

NS_ASSUME_NONNULL_END
