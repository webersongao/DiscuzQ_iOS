//
//  DZNetCenter+API_V3_0.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZQNetApi_V3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (API_V3_0)

#pragma mark   /*************** Site ***************/


/// 全部 Emoji表情[列表]
-(void)dzApiv3_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *varModel, BOOL success))completion;

-(void)dzApiv3_siteforumInfoWithCompletion:(void (^)(DZQSiteV3 *siteModel, BOOL success))completion;

-(void)dzApiv3_categoryListWithCompletion:(void (^)(NSArray<DZQCateV3 *> *varModel, BOOL success))completion;


#pragma mark   /*************** Post ***************/


/// 查询 特定主题 回复 接口[列表]
-(void)dzApiv3_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;

/// 查询 特定关键字 回复 接口[列表]
-(void)dzApiv3_PostListWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;

/// 查询 特定用户 回复 接口[列表]
-(void)dzApiv3_PostListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定 用户名 回复 接口[列表]
-(void)dzApiv3_PostListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定分类下 回复 接口[列表]
-(void)dzApiv3_PostListWithCate:(NSString *)categoryId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// 查询 特定回复 的二级回复接口[列表]
-(void)dzApiv3_PostListWithReply:(NSString *)reply_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;


/// ❤️上传附件
-(void)dzApiv3_attachmentUploadWithFile:(NSString *)filePath isGallery:(NSInteger)isGallery isSound:(NSInteger)isSound progress:(void (^)(double progress))backProgress completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️删除 附件
-(void)dzApiv3_attachmentDeleteWithUUid:(NSString *)uuid completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;


/// ❤️创建举报数据 _回复
-(void)dzApiv3_postReportWithUser:(NSString *)user_id thread:(NSString *)thread_id post:(NSString *)post_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion;

/// ❤️创建举报数据 _主题
-(void)dzApiv3_threadReportWithUser:(NSString *)user_id thread:(NSString *)thread_id reason:(NSString *)reason completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL success))completion;

/// ❤️获取话题列表
/// @param content 话题内容（模糊查询）
/// @param username 话题作者
-(void)dzApiv3_TopicListOfThreadWithKey:(NSString *)content username:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;


/// 查询话题接口[单条]
/// @param topic_id 话题Id
-(void)dzApiv3_TopicOneOfThreadWithTopic:(NSString *)topic_id completion:(void (^)(DZQDataTopic *dataTopic,BOOL success))completion;


/// ❤️创建回复
-(void)dzApiv3_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;

/// ❤️删除回复
-(void)dzApiv3_PostDeleteWithPost:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;

/// ❤️修改回复 -- 忽略
-(void)dzApiv3_PostIgnoreWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;

/// ❤️修改回复 -- 删除
-(void)dzApiv3_PostDeleteWithSubCtrl:(NSString *)comment_id completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;

/// ❤️修改回复 -- 喜欢(点赞)
-(void)dzApiv3_PostLikeOrNotWithPost:(NSString *)Post_id isLiked:(BOOL)isLiked completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;

/// ❤️修改回复 -- 修改内容
-(void)dzApiv3_PostResetContentWithSubCtrl:(NSString *)comment_id Content:(NSString *)content completion:(void (^)(DZQDataPost *dataPost,BOOL success))completion;


#pragma mark   /*************** User ***************/

/// 退出登录
-(void)dzApiv3_loginOutWithCompletion:(void (^)(void))completion;


/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzApiv3_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQAuthV1 *varModel, BOOL success))completion;


//// 用户登录
-(void)dzApiv3_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserV1 *userModel,DZQTokenV1 *tokenModel,BOOL success))completion;

//// 重置密码
-(void)dzApiv3_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserV1 *varModel, BOOL success))completion;

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录
-(void)dzApiv3_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQResV1 * varModel,BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure;


/// ❤️用户搜索
/// @param userName 用户名：多个用户名用半角逗号隔开 用户名前或后加星号可使用模糊搜索
-(void)dzApiv3_userSearcWithName:(NSString *)userName page:(NSInteger)page completion:(void (^)(DZQResV1 * varModel,BOOL success))completion;

/// ❤️通知消息删除
/// @param noti_id 消息id：12 或者 11,12,13
-(void)dzApiv3_notiDeleteWithNoti:(NSString * )noti_id completion:(void (^)(BOOL success))completion;

/// 消息列表
-(void)dzApiv3_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion;


/// 普通用户创建邀请码
-(void)dzApiv3_userinviteCodeWithSuccess:(void (^)(NSString * codeString))completion;

/// ❤️用户钱包 详情
/// @param user_id User_id
-(void)dzApiv3_userWalletInfoWithUser_id:(NSString *)user_id completion:(void (^)(DZQDataWallet *dataWallet, BOOL success))completion;


/// ❤️提现记录列表
/// @param user_id User_id
-(void)dzApiv3_userWalletCashlistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQCashV1 *> *dataWallet, BOOL success))completion;


/// 钱包动账记录
/// @param user_id User_id
-(void)dzApiv3_userWalletLoglistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataCashLog *> *varModel, BOOL hasMore, BOOL success))completion;

/// ❤️提现申请
-(void)dzApiv3_userWalletWithdrawWithAmount:(NSInteger)amount completion:(void (^)(DZQDataCash *dataCash, BOOL success))completion;

/// ❤️创建关注关系
/// @param to_user_id *被关注着 id
-(void)dzApiv3_followShipCreateWithUser:(NSString *)to_user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;


/// ❤️删除（取消）关注关系
/// @param user_id *被关注着 id
-(void)dzApiv3_followShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;


/// ❤️删除粉丝
/// @param user_id *被关注着 id
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzApiv3_fansShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;

/// 获取关注列表
/// @param user_id *用户id
/// @param isfan 是否是粉丝列表（我的粉丝 或 我的关注）
-(void)dzApiv3_followShipListWithUser:(NSString *)user_id isfan:(BOOL)isfan page:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL hasMore,BOOL success))completion;


/// ❤️用户组 列表
-(void)dzApiv3_userGroupListWithDefault:(BOOL)isDefault Paid:(BOOL)isPaid page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore, BOOL success))completion;


/// ❤️修改用户头像
/// @param filaPath 头像文件
-(void)dzApiv3_userAvatarUploadWithUser:(NSString *)user_id file:(NSString *)filaPath progress:(PRProgressBlock)upProgress completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;


/// ❤️修改用户资料
-(void)dzApiv3_userInfoModifyWithUser:(NSString *)user_id paraDict:(NSDictionary *)paraDict completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;

///  ❤️身份实名认证
-(void)dzApiv3_userVerifyWithUser:(NSString *)realname identity:(NSString *)identity completion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️修改用户 支付密码
-(void)dzApiv3_userModifyPayPWDWithPayPwd:(NSString *)pay_password completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;


/// ❤️用户订单 列表
/// @param user_id 用户id
-(void)dzApiv3_userOrderListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore,BOOL success))completion;

/// ❤️查询订单（单条）
/// @param order_sn 订单唯一编号
-(void)dzApiv3_userOrderOneWithOrder:(NSString *)order_sn completion:(void (^)(DZQDataOrder *DataOrder,BOOL success))completion;

/// ❤️拉黑某个用户
-(void)dzApiv3_userCreateDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;

/// ❤️取消 拉黑某个用户
-(void)dzApiv3_userCancelDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;

/// ❤️某个用户 的拉黑用户列表
-(void)dzApiv3_userDenyListWithUser:(NSString *)user_id completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion;


/// ❤️创建会话
-(void)dzApiv3_MsgDialogCreateWithUser:(NSString *)userName message:(NSString *)message completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion;

/// ❤️获取会话列表
-(void)dzApiv3_MsgDialogListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataDialog *> *dataDialogArr, BOOL success))completion;

/// ❤️创建会话 消息
-(void)dzApiv3_MsgDialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion;

/// ❤️获取会话消息列表
-(void)dzApiv3_MsgDialogMessageListWithDialog:(NSString *)dialog_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion;


#pragma mark   /*************** Thread ***************/


/// 获取 特定分类 下主题列表
-(void)dzApiv3_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 获取 特定分类 下主题列表 (是否精华 以及已关注)
-(void)dzApiv3_threadListWithSuperCate:(NSString *)cate_id morefilter:(NSString *)morefilter  page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 主题搜索（关键词） 列表
-(void)dzApiv3_threadListSearchWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 获取 特定用户id 主题列表
-(void)dzApiv3_threadListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 用户名搜索 主题列表
-(void)dzApiv3_threadListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 【 精华、置顶 】主题列表
/// @param isEssence 是否是精华
/// @param isSticky 是否是 置顶
-(void)dzApiv3_threadListWithEssence:(BOOL)isEssence isSticky:(BOOL)isSticky page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;



/// 某人 关注的 主题列表（会验证是否为当前登录用户）
-(void)dzApiv3_threadListWithFollowUser:(NSString *)fromUserId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 特定类型的 主题列表 （0 普通 1 长文 2 视频 3 图片）
-(void)dzApiv3_threadListWithType:(NSInteger)type page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 特定话题 的 主题列表
-(void)dzApiv3_threadListWithTopic:(NSString *)topicId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;


/// 获取 单一主题详细信息
-(void)dzApiv3_threadOneWithThreadId:(NSString *)thread_id completion:(void (^)(DZQThreadV3 *threadData,BOOL success))completion;

/// 分享主题时获取主题信息接口[单条]
-(void)dzApiv3_threadShareWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *dataThread,BOOL success))completion;

/// 收藏 主题 列表
-(void)dzApiv3_threadFavoriteListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 用户 点赞 主题列表
-(void)dzApiv3_thread_UserlikeListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️查询我点赞的 评论回复 接口[列表]
-(void)dzApiv3_PostLikedListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion;

/// ❤️创建云点播前端上传签名
-(void)dzApiv3_thread_UploadSignatureWithCompletion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️创建主题接口
-(void)dzApiv3_threadPublishWithPara:(DZThreadDraftM *)threadpPara captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure;

/// ❤️删除主题
-(void)dzApiv3_threadDeleteWithThread:(NSString *)thread_id completion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️创建视频主题（回调）
-(void)dzApiv3_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name completion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️加精 主题
-(void)dzApiv3_threadEssenceWithThread:(NSString *)thread_id isEssence:(BOOL)isEssence completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️置顶 主题
-(void)dzApiv3_threadStickyWithThread:(NSString *)thread_id isSticky:(BOOL)isSticky completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️删除 主题
-(void)dzApiv3_threadDeleteWithThread:(NSString *)thread_id isDeleted:(BOOL)isDeleted completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️收藏 主题
-(void)dzApiv3_threadFavoriteWithThread:(NSString *)thread_id isFavorite:(BOOL)isFavorite completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;

/// ❤️修改分类
-(void)dzApiv3_threadResetCateWithThread:(NSString *)thread_id cate:(NSString *)cate_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion;



@end

NS_ASSUME_NONNULL_END
