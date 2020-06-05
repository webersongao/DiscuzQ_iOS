//
//  DZNetCenter+User.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+User.h"
#import "DZMsgDataTool.h"

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
-(void)dzx_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQRegModel *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_registerWithName:username password:password token:nil mobile:nil code:nil success:^(DZQResModel * resModel, BOOL success) {
        DZQRegModel *regModel = (DZQRegModel *)resModel.dataBody.firstObject.attributes;
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
-(void)dzx_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserModel *userModel,DZQBaseToken *tokenModel,BOOL success))completion{
    
    [[DZQNetTool shared] dz_loginWithName:username password:password token:nil mobile:mobile success:^(DZQResModel *resModel,BOOL success) {
        
        DZQBaseToken *token = (DZQBaseToken *)resModel.dataBody.firstObject.attributes;
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


/// 消息列表
//   filter: 通知类型
//    默认不传查全部
//    system 系统通知
//    replied 回复我的
//    liked 点赞我的
//    rewarded 打赏我的
//    related @我的
-(void)dzx_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion{
    
    [[DZQNetTool shared] dz_notiListWithTypeFilter:filter success:^(DZQResModel *data, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataNotis = [DZMsgDataTool NotiResData:data.dataBody];
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


@end
