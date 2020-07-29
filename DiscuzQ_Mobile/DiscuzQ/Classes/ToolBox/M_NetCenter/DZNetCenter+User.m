//
//  DZNetCenter+User.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+User.h"
#import "DZNotiDataTool.h"
#import "DZUserTool.h"

@implementation DZNetCenter (User)


/// 退出登录
-(void)dzx_loginOutWithCompletion:(void (^)(void))completion{
    
    [[DZQNetTool shared] dz_loginOutWithCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzx_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQAuthModel *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_registerWithName:username password:password token:nil mobile:nil code:nil success:^(DZQResModel * resModel, BOOL success) {
        DZQAuthModel *regModel = (DZQAuthModel *)resModel.dataBody.firstObject.attributes;
        if (completion) {
            completion(regModel,success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


//// 用户登录
-(void)dzx_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserModel *userModel,DZQTokenModel *tokenModel,BOOL success))completion{
    
    [[DZQNetTool shared] dz_loginWithName:username password:password token:nil mobile:mobile success:^(DZQResModel *resModel,BOOL success) {
        
        DZQTokenModel *token = (DZQTokenModel *)resModel.dataBody.firstObject.attributes;
        DZQLoginRelationModel *userRelate = (DZQLoginRelationModel *)resModel.dataBody.firstObject.relationships;
        
        [DZLoginModule saveLoginUserData:resModel.oriRes_formart.data.firstObject andHandle:^{
            if (completion) {
                completion(userRelate.users.attributes,token,success);
            }
        }];
        
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,nil,NO);
        }
    }];
}

//// 重置密码
-(void)dzx_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserModel *varModel, BOOL success))completion{
    
    
    
}

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录(includeStr = groups,wechat )
/*
 include    string    否    关联数据，可选值：groups,wechat(只有当前登录用户可以使用) ,dialog
 */
-(void)dzx_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQResModel * varModel,BOOL success))completion{
    
    NSString *includeStr = isMe ? @"wechat" : @"";
    [[DZQNetTool shared] dz_userInfoWithUserId:checkNull(userId) include:includeStr success:^(DZQResModel * data, BOOL success) {
        if (completion) {
            completion(data,success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
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
-(void)dzx_userSearcWithName:(NSString *)userName page:(NSInteger)page completion:(void (^)(DZQResModel * varModel,BOOL success))completion{
    
    NSString *filterStr = [NSString stringWithFormat:@"filter[username]=%@&filter[status]=normal&include=groups&sort=createdAt&page[number]=%ld&page[limit]=20",checkNull(userName),(long)page];
    [[DZQNetTool shared] dz_userSearcWithFilter:filterStr page:page success:^(DZQResModel * data, BOOL success) {
        if (completion) {
            completion(data,success);
        }
    } failure:^(NSError *error) {
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
 withdrawal 提现通知    rewarded,withdrawal (逗号拼接,支持传多个)
 
 page[number]    int    否    页码
 page[limit]    int    否    单页数量
 */
-(void)dzx_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion{
    
    NSString *query = [NSString stringWithFormat:@"&filter[type]=%@",checkNull(filter)];
    
    [[DZQNetTool shared] dz_notiListWithTypeQuery:query success:^(DZQResModel *data, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataNotis = [DZNotiDataTool NotiResData:data.dataBody];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataNotis,data.hasMore,data.success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 通知消息删除
/// @param noti_id 消息id：12 或者 11,12,13
-(void)dzx_notiDeleteWithNoti:(NSString * )noti_id completion:(void (^)(BOOL success))completion{
    
    noti_id = DZQStrNull(noti_id);
    if (!noti_id.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_notiDeleteWithTypeQuery:noti_id success:^(DZQResModel *data, BOOL success) {
        dispatch_async(self.formartQueue, ^{
//            NSArray *dataNotis = [DZNotiDataTool NotiResData:data.dataBody];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(data.success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(NO);
        }
    }];
}


/// 普通用户创建邀请码
-(void)dzx_userinviteCodeWithSuccess:(void (^)(NSString * codeString))completion{
    
    [[DZQNetTool shared] dz_userinviteCodeWithSuccess:^(NSString * codeString, BOOL success) {
        if (completion) {
            completion(codeString);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil);
        }
    }];
    
}



/// 用户钱包 详情
/// @param user_id User_id
-(void)dzx_userWalletInfoWithUser_id:(NSString *)user_id completion:(void (^)(DZQDataWallet *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        return;
    }
    [[DZQNetTool shared] dz_userWalletInfoWithSubCtrl:user_id success:^(DZQResModel * resModel, BOOL success) {
        DZQDataWallet *data = (DZQDataWallet *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_userWalletCashlistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQCashModel *> *dataWallet, BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        return;
    }
    
    NSString *query = [NSString stringWithFormat:@"include=user,userWallet&sort=created_at&filter[user]=%@&page[number]=%ld&page[size]=20",user_id,page];
    
    [[DZQNetTool shared] dz_userWalletCashlistWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_userWalletLoglistWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataCashLog *> *varModel, BOOL hasMore,BOOL success))completion{
    
    user_id = checkNull(user_id);
    if (!user_id.length) {
        return;
    }
    
    NSString *inclueStr = @"include=user,userWallet,userWalletCash,order";
    NSString *query = [NSString stringWithFormat:@"%@&sort=created_at&filter[user]=%@&page[number]=%ld&page[size]=20",inclueStr,user_id,page];
    
    [[DZQNetTool shared] dz_userWalletLoglistWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
//        NSArray *cashArray = [DZNotiDataTool NotiResData:data.dataBody];
        NSArray *cashArray = resModel.dataBody;
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 提现申请
/// @param amount 提现金额为整数
-(void)dzx_userWalletWithdrawWithAmount:(NSInteger)amount completion:(void (^)(DZQDataCash *dataCash, BOOL success))completion{
  
    [[DZQNetTool shared] dz_userWalletWithdrawWithAmount:amount success:^(DZQResModel * resModel, BOOL success) {
        DZQDataCash *data = (DZQDataCash *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)dzx_followShipCreateWithUser:(NSString *)to_user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    to_user_id = checkNull(to_user_id);
    if (!to_user_id.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_followShipCreateWithUser:to_user_id success:^(DZQResModel * resModel, BOOL success) {
        DZQDataFollow *data = (DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 删除（取消）关注关系
/// @param user_id *被关注着 id
/// @param isfans 是否是删除粉丝? （不是删除粉丝 就是 删除关注）
/// /api/follow/{id}/{type}
/// id    int    是    要操作的用户 ID
/// type    int    是    要操作的类型（1：删除关注 2：删除粉丝）
-(void)dzx_followShipDeleteWithUser:(NSString *)user_id isfans:(BOOL)isfans completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    NSString *subCtrl = [NSString stringWithFormat:@"/%@/%d",user_id,isfans ? 2 : 1];
    
    [[DZQNetTool shared] dz_followShipDeleteWithSubCtrl:subCtrl success:^(DZQResModel * resModel, BOOL success) {
        DZQDataFollow *data = (DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
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
 
 #include 可关联的数据
 toUser    users    object    否    关注用户，配合 type=1 使用
 fromUser    users    object    否    粉丝用户，配合 type=2 使用
 fromUser.groups    groups    object    否    粉丝的用户组
 toUser.groups    groups    object    否    关注的用户组
 
 */
-(void)dzx_followShipListWithUser:(NSString *)user_id isfan:(BOOL)isfan page:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=toUser,fromUser,fromUser.groups,toUser.groups"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[type]=%d&filter[user_id]=%@&page[number]=%ld&page[limit]=20",includeStr,(isfan ? 2 : 1),user_id,(long)page];
    
    [[DZQNetTool shared] dz_followShipListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *dataArray = [DZUserTool User_dataFollowResData:resModel];
        if (completion) {
            completion(dataArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}








/// 用户组 列表
/*
 include    string    否    关联数据
 filter[isDefault]    string    否    是否只返回默认用户组
 filter[type]    string    否    传 invite 返回可邀请用户组（邀请页使用，不返回游客用户组）
 #include 可关联的数据
 permission    permission    object    是    权限
 */
-(void)dzx_userGroupListWithDefault:(BOOL)isDefault page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore, BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=permission"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[type]=invite&filter[isDefault]=%@&page[number]=%ld&page[limit]=20",includeStr,(isDefault ? @"yes" : @"no"),page];
    
    [[DZQNetTool shared] dz_userGroupListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 修改用户头像
/// @param filaPath 头像文件
-(void)dzx_userAvatarUploadWithUser:(NSString *)user_id file:(NSString *)filaPath progress:(PRProgressBlock)upProgress completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    NSString *subCtrl = [NSString stringWithFormat:@"%@/avatar",user_id];
    
    [[DZQNetTool shared] dz_userAvatarUploadWithSubCtrl:subCtrl file:filaPath progress:^(double Progress) {
        if (upProgress) {
            upProgress(Progress);
        }
    } success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 修改用户资料
-(void)dzx_userInfoModifyWithUser:(NSString *)user_id paraDict:(NSDictionary *)paraDict completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    if (!paraDict.allValues.count) {
        return;
    }
    
    [[DZQNetTool shared] dz_userInfoModifyWithSubCtrl:user_id paraDict:paraDict success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_userVerifyWithUser:(NSString *)realname identity:(NSString *)identity completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    identity = checkNull(identity);
    if (!identity.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_userVerifyWithUser:realname identityNo:identity success:^(DZQResModel * resModel, BOOL success) {
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

/// 修改用户 支付密码
-(void)dzx_userModifyPayPWDWithPayPwd:(NSString *)pay_password completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL success))completion{
    
    pay_password = checkNull(pay_password);
    if (!pay_password.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_userModifyPayPWDWithPayPwd:pay_password success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_userOrderListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataGroup *> *varModel, BOOL hasMore,BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include="];
    NSString *query = [NSString stringWithFormat:@"%@&filter[user]=%@&page[number]=%ld&page[limit]=20",includeStr,user_id,page];
    
    [[DZQNetTool shared] dz_userOrderListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/// 查询订单（单条）
/// @param order_sn 订单唯一编号
-(void)dzx_userOrderOneWithOrder:(NSString *)order_sn completion:(void (^)(DZQDataOrder *DataOrder,BOOL success))completion{
    
    [[DZQNetTool shared] dz_userOrderOneWithSubCtrl:order_sn success:^(DZQResModel * resModel, BOOL success) {
        DZQDataOrder *data = (DZQDataOrder *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


/// 拉黑某个用户
-(void)dzx_userCreateDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] dz_userCreateDenyWithSubCtrl:subCtrl success:^(DZQResModel * resModel, BOOL success) {
        DZQDataFollow *data = (DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 取消 拉黑某个用户
-(void)dzx_userCancelDenyWithUser:(NSString *)user_id completion:(void (^)(DZQDataFollow *dataFollow, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] dz_userCancelDenyWithSubCtrl:subCtrl success:^(DZQResModel * resModel, BOOL success) {
        DZQDataFollow *data = (DZQDataFollow *)resModel.dataBody.firstObject;
        if (completion) {
            completion(data,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

/// 某个用户 的拉黑用户列表
-(void)dzx_userDenyListWithUser:(NSString *)user_id completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    user_id = DZQStrNull(user_id);
    if (!user_id.length) {
        return;
    }
    NSString *subCtrl = DZQTwoStr(user_id, @"/deny");
    
    [[DZQNetTool shared] dz_userDenyListWithSubCtrl:subCtrl success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}


#pragma mark   /********************* 消息 *************************/

/// 创建会话
-(void)dzx_Msg_dialogCreateWithUser:(NSString *)userName message:(NSString *)message completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    message = checkNull(message);
    if (!message.length) {
        return;
    }
    
    [[DZQNetTool shared] dz_Msg_dialogCreateWithUserName:userName message:message success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_Msg_dialogListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataFollow *> *dataWallet, BOOL success))completion{
    
    NSString *includeStr = [NSString stringWithFormat:@"include=sender,recipient,sender.groups,recipient.groups,dialogMessage"];
    NSString *query = [NSString stringWithFormat:@"%@&sort=&page[number]=%ld&page[limit]=20",includeStr,page];
    
    [[DZQNetTool shared] dz_Msg_dialogListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_Msg_dialogMessageCreateWithMsg:(NSString *)message dialog_id:(NSString *)dialog_id attachment_id:(NSString *)attachment_id completion:(void (^)(NSArray<DZQDataUser *> *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_Msg_dialogMessageCreateWithMsg:message dialog_id:dialog_id attachment_id:attachment_id success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.success);
        }
    } failure:^(NSError *error) {
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
-(void)dzx_Msg_dialogMessageListWithDialog:(NSString *)dialog_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataUser *> *varModel,BOOL hasMore, BOOL success))completion{
    
    dialog_id = checkNull(dialog_id);
    if (!dialog_id.length) {
        return;
    }
    
    NSString *includeStr = [NSString stringWithFormat:@"include=attachment,user,user.groups"];
    NSString *query = [NSString stringWithFormat:@"%@&filter[dialog_id]=%@&sort=createdAt&page[number]=%ld&page[limit]=20",includeStr,dialog_id,page];
    
    [[DZQNetTool shared] dz_Msg_dialogMessageListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        NSArray *cashArray = nil;// [DZNotiDataTool NotiResData:data.dataBody];
        if (completion) {
            completion(cashArray,resModel.hasMore,resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
    
}


@end
