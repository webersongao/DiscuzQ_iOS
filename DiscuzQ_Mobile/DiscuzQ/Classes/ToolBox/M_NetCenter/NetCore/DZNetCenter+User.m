//
//  DZNetCenter+User.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+User.h"
#import "DZNetCenter+API_V1_0.h"
#import "DZNetCenter+API_V3_0.h"
#import "DZNetFormatter+Adapter.h"

@implementation DZNetCenter (User)

/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzx_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQAuthV1 *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_registerWithName:username password:password completion:^(DZQAuthV1 * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}


//// 用户登录
-(void)dzx_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserV1 *userModel,DZQTokenV1 *tokenModel,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_loginWithName:username password:password mobile:mobile completion:^(DZQUserV1 * _Nonnull userModel, DZQTokenV1 * _Nonnull tokenModel, BOOL success) {
            if (completion) {
                completion(userModel,tokenModel,success);
            }
        }];
    }
}

//// 重置密码
-(void)dzx_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserV1 *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_resetPwdWithPassword:password newPassword:newPassword password_confirmation:password_confirmation completion:^(DZQUserV1 * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录(includeStr = groups,wechat )
/*
 include    string    否    关联数据，可选值：groups,wechat(只有当前登录用户可以使用) ,dialog
 */
-(void)dzx_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQDataUser * dataModel,BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure{
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak DZNetCenter *weakMself = self;
    void (^successCallBack)(id resModel, BOOL) = ^(id resModel, BOOL success) {
        __block DZUserM *userM = nil;
        formatterCenter_async_task(^{
            userM = [weakMself.formatter user_ConvertWithObj:resModel].firstObject;
        }, ^{
            //            if (completion) {
            //                completion(userM,success);
            //            }
        });
    };
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userInfoWithUserId:userId isMe:isMe completion:^(DZQResV1 * _Nonnull varModel, BOOL success) {
            DZQDataUser *dataUser = [[DZQDataUser alloc] init];
            dataUser.type = varModel.dataBody.firstObject.type;
            dataUser.inner_id = varModel.dataBody.firstObject.inner_id;
            dataUser.attributes = (DZQUserV1 *)(varModel.dataBody.firstObject.attributes);
            dataUser.relationships = (DZQUserRelationV1 *)(varModel.dataBody.firstObject.relationships);
            if (completion) {
                completion(dataUser,success);
            }
        } failure:^(DZQErrorV1 * _Nonnull varModel) {
            if (failure) {
                failure(varModel);
            }
        }];
    }
}


/// 用户搜索
/// @param userName 用户名：多个用户名用半角逗号隔开 用户名前或后加星号可使用模糊搜索
-(void)dzx_userSearcWithName:(NSString *)userName page:(NSInteger)page completion:(void (^)(DZQResV1 * varModel,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userSearcWithName:userName page:page completion:^(DZQResV1 * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}


/// 消息列表
-(void)dzx_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_notiListWithTypeFilter:filter completion:^(NSArray<DZQDataNoti *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}

/// 通知消息删除
/// @param noti_id 消息id：12 或者 11,12,13
-(void)dzx_notiDeleteWithNoti:(NSString * )noti_id completion:(void (^)(BOOL success))completion{
    
    noti_id = DZQStrNull(noti_id);
    if (!noti_id.length) {
        if (completion) { completion(NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_notiDeleteWithNoti:noti_id completion:^(BOOL success) {
            if (completion) {
                completion(success);
            }
        }];
    }
}


/// 普通用户创建邀请码
-(void)dzx_userinviteCodeWithSuccess:(void (^)(NSString * codeString))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userinviteCodeWithSuccess:^(NSString * _Nonnull codeString) {
            if (completion) {
                completion(codeString);
            }
        }];
    }
    
}



/// 用户钱包 详情
/// @param user_id User_id
-(void)dzx_userWalletInfoWithUser_id:(NSString *)user_id completion:(void (^)(DZQDataWallet *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userWalletInfoWithUser_id:user_id completion:^(DZQDataWallet * _Nonnull dataWallet, BOOL success) {
            if (completion) {
                completion(dataWallet,success);
            }
        }];
    }
    
}


/// 提现记录列表
/// @param user_id User_id
-(void)dzx_userWalletCashlistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQCashV1 *> *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userWalletCashlistWithUser:user_id page:page completion:^(NSArray<DZQCashV1 *> * _Nonnull dataWallet, BOOL success) {
            if (completion) {
                completion(dataWallet,success);
            }
        }];
    }
    
}


/// 钱包动账记录
/// @param user_id User_id
-(void)dzx_userWalletLoglistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataCashLog *> *varModel, BOOL hasMore,BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO,NO); }
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userWalletLoglistWithUser:user_id page:page completion:^(NSArray<DZQDataCashLog *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}

/// 提现申请
/// @param amount 提现金额为整数
-(void)dzx_userWalletWithdrawWithAmount:(NSInteger)amount completion:(void (^)(DZQDataCash *dataCash, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userWalletWithdrawWithAmount:amount completion:^(DZQDataCash * _Nonnull dataCash, BOOL success) {
            if (completion) {
                completion(dataCash,success);
            }
        }];
    }
}


/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)dzx_followShipCreateWithUser:(NSString *)to_user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    to_user_id = checkNull(to_user_id);
    if (!to_user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_followShipCreateWithUser:to_user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (completion) {
                completion(dataFollow,success);
            }
        }];
    }
    
}


/// 删除粉丝
/// @param user_id *被关注着 id
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzx_fansShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_fansShipDeleteWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (completion) {
                completion(dataFollow,success);
            }
        }];
    }
    
}

/// 删除（取消）关注关系
/// @param user_id *被关注着 id
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzx_followShipDeleteWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_followShipDeleteWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (completion) {
                completion(dataFollow,success);
            }
        }];
    }
    
}

/// 获取关注列表
/// @param user_id *用户id
/// @param isfan 是否是粉丝列表（我的粉丝 或 我的关注）
-(void)dzx_followShipListWithUser:(NSString *)user_id isfan:(BOOL)isfan page:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_followShipListWithUser:user_id isfan:isfan page:page completion:^(NSArray<DZQDataFollow *> * _Nonnull dataWallet, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(dataWallet,hasMore,success);
            }
        }];
    }
}








/// 用户组 列表
-(void)dzx_userGroupListWithDefault:(BOOL)isDefault Paid:(BOOL)isPaid page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userGroupListWithDefault:isDefault Paid:isPaid page:page completion:^(NSArray<DZQDataGroup *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}

/// 修改用户头像
/// @param filaPath 头像文件
-(void)dzx_userAvatarUploadWithUser:(NSString *)user_id file:(NSString *)filaPath progress:(PRProgressBlock)upProgress completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userAvatarUploadWithUser:user_id file:filaPath progress:^(double Progress) {
            
        } completion:^(NSArray<DZQDataGroup *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
    
}


/// 修改用户资料
-(void)dzx_userInfoModifyWithUser:(NSString *)user_id paraDict:(NSDictionary *)paraDict completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    if (!paraDict.allValues.count) {
        if (completion) { completion(nil,NO); }
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userInfoModifyWithUser:user_id paraDict:paraDict completion:^(NSArray<DZQDataGroup *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}


///  身份实名认证
/*
 identity    string    是    身份证号
 realname    string    是    姓名
 */
-(void)dzx_userVerifyWithUser:(NSString *)realname identity:(NSString *)identity completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    identity = checkNull(identity);
    if (!identity.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userVerifyWithUser:realname identity:identity completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

/// 修改用户 支付密码
-(void)dzx_userModifyPayPWDWithPayPwd:(NSString *)pay_password completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    pay_password = checkNull(pay_password);
    if (!pay_password.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userModifyPayPWDWithPayPwd:pay_password completion:^(NSArray<DZQDataGroup *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}



/// 用户订单 列表
/// @param user_id 用户id
-(void)dzx_userOrderListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userOrderListWithUser:user_id page:page completion:^(NSArray<DZQDataGroup *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}

/// 查询订单（单条）
/// @param order_sn 订单唯一编号
-(void)dzx_userOrderOneWithOrder:(NSString *)order_sn completion:(void (^)(DZQDataOrder *DataOrder,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userOrderOneWithOrder:order_sn completion:^(DZQDataOrder * _Nonnull DataOrder, BOOL success) {
            if (completion) {
                completion(DataOrder,success);
            }
        }];
    }
}


/// 拉黑某个用户
-(void)dzx_userCreateDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userCreateDenyWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (completion) {
                completion(dataFollow,success);
            }
        }];
    }
}


/// 取消 拉黑某个用户
-(void)dzx_userCancelDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userCancelDenyWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (completion) {
                completion(dataFollow,success);
            }
        }];
    }
    
}

/// 某个用户 的拉黑用户列表
-(void)dzx_userDenyListWithUser:(NSString *)user_id completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        if (completion) { completion(nil,NO,NO); }
        return;
    }
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_userDenyListWithUser:user_id completion:^(NSArray<DZQDataUser *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


#pragma mark   /********************* 消息 *************************/

/// 创建会话
-(void)dzx_Msg_dialogCreateWithUser:(NSString *)userName message:(NSString *)message completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    message = checkNull(message);
    if (!message.length) {
        if (completion) { completion(nil,NO); }
        return;
    }
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_MsgDialogCreateWithUser:userName message:message completion:^(NSArray<DZQDataUser *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

/// 获取会话列表
-(void)dzx_Msg_dialogListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataDialog *> *dataDialogArr, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_MsgDialogListWithPage:page completion:^(NSArray<DZQDataDialog *> * _Nonnull dataDialogArr, BOOL success) {
            if (completion) {
                completion(dataDialogArr,success);
            }
        }];
    }
}

/// 创建会话 消息
-(void)dzx_Msg_dialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_MsgDialogMessageCreateWithMsg:message dialog_id:dialog_id attachment_id:attachment_id completion:^(NSArray<DZQDataUser *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}


/// 获取会话消息列表
-(void)dzx_Msg_dialogMessageListWithDialog:(NSString *)dialog_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_MsgDialogMessageListWithDialog:dialog_id page:page completion:^(NSArray<DZQDataUser *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


@end
