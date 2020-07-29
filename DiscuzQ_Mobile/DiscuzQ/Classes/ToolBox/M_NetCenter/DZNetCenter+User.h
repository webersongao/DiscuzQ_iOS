//
//  DZNetCenter+User.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZQTokenModel.h"
#import "DZQUserModel.h"
#import "DZQCashModel.h"
#import "DZQOrderModel.h"
#import "DZQDialogModel.h"
#import "DZQFollowModel.h"
#import "DZQWalletModel.h"
#import "DZQCashLogModel.h"
#import "DZQMessageModel.h"
#import "DZQGroupModel.h"
#import "DZQPermissionModel.h"
#import "DZQProfileRelationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (User)


/// 退出登录
-(void)dzx_loginOutWithCompletion:(void (^)(void))completion;


/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzx_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQAuthModel *varModel, BOOL success))completion;


//// 用户登录
-(void)dzx_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserModel *userModel,DZQTokenModel *tokenModel,BOOL success))completion;

//// 重置密码
-(void)dzx_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserModel *varModel, BOOL success))completion;

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录
-(void)dzx_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQResModel * varModel,BOOL success))completion;


/// ❤️用户搜索
/// @param userName 用户名：多个用户名用半角逗号隔开 用户名前或后加星号可使用模糊搜索
-(void)dzx_userSearcWithName:(NSString *)userName page:(NSInteger)page completion:(void (^)(DZQResModel * varModel,BOOL success))completion;

/// ❤️通知消息删除
/// @param noti_id 消息id：12 或者 11,12,13
-(void)dzx_notiDeleteWithNoti:(NSString * )noti_id completion:(void (^)(BOOL success))completion;

/// 消息列表
-(void)dzx_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion;


/// 普通用户创建邀请码
-(void)dzx_userinviteCodeWithSuccess:(void (^)(NSString * codeString))completion;

/// ❤️用户钱包 详情
/// @param user_id User_id
-(void)dzx_userWalletInfoWithUser_id:(NSString *)user_id completion:(void (^)(DZQDataWallet *dataWallet, BOOL success))completion;


/// ❤️提现记录列表
/// @param user_id User_id
-(void)dzx_userWalletCashlistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQCashModel *> *dataWallet, BOOL success))completion;


/// 钱包动账记录
/// @param user_id User_id
-(void)dzx_userWalletLoglistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataCashLog *> *varModel, BOOL hasMore, BOOL success))completion;

/// ❤️提现申请
-(void)dzx_userWalletWithdrawWithAmount:(NSInteger)amount completion:(void (^)(DZQDataCash *dataCash, BOOL success))completion;

/// ❤️创建关注关系
/// @param to_user_id *被关注着 id
-(void)dzx_followShipCreateWithUser:(NSString *)to_user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;


/// ❤️删除（取消）关注关系
/// @param user_id *被关注着 id
/// @param isfans 是否是删除粉丝? （不是删除粉丝 就是 删除关注）
-(void)dzx_followShipDeleteWithUser:(NSString *)user_id isfans:(BOOL)isfans completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;


/// 获取关注列表
/// @param user_id *用户id
/// @param isfan 是否是粉丝列表（我的粉丝 或 我的关注）
-(void)dzx_followShipListWithUser:(NSString *)user_id isfan:(BOOL)isfan page:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL hasMore,BOOL success))completion;


/// ❤️用户组 列表
-(void)dzx_userGroupListWithDefault:(BOOL)isDefault page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore, BOOL success))completion;


/// ❤️修改用户头像
/// @param filaPath 头像文件
-(void)dzx_userAvatarUploadWithUser:(NSString *)user_id file:(NSString *)filaPath progress:(PRProgressBlock)upProgress completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;


/// ❤️修改用户资料
-(void)dzx_userInfoModifyWithUser:(NSString *)user_id paraDict:(NSDictionary *)paraDict completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;

///  ❤️身份实名认证
-(void)dzx_userVerifyWithUser:(NSString *)realname identity:(NSString *)identity completion:(void (^)(DZQDataUser *varModel, BOOL success))completion;

/// ❤️修改用户 支付密码
-(void)dzx_userModifyPayPWDWithPayPwd:(NSString *)pay_password completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion;


/// ❤️用户订单 列表
/// @param user_id 用户id
-(void)dzx_userOrderListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore,BOOL success))completion;

/// ❤️查询订单（单条）
/// @param order_sn 订单唯一编号
-(void)dzx_userOrderOneWithOrder:(NSString *)order_sn completion:(void (^)(DZQDataOrder *DataOrder,BOOL success))completion;

/// ❤️拉黑某个用户
-(void)dzx_userCreateDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;

/// ❤️取消 拉黑某个用户
-(void)dzx_userCancelDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion;

/// ❤️某个用户 的拉黑用户列表
-(void)dzx_userDenyListWithUser:(NSString *)user_id completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion;


/// ❤️创建会话
-(void)dzx_Msg_dialogCreateWithUser:(NSString *)userName message:(NSString *)message completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion;

/// ❤️获取会话列表
-(void)dzx_Msg_dialogListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL success))completion;

/// ❤️创建会话 消息
-(void)dzx_Msg_dialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion;

/// ❤️获取会话消息列表
-(void)dzx_Msg_dialogMessageListWithDialog:(NSString *)dialog_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion;


@end

NS_ASSUME_NONNULL_END

