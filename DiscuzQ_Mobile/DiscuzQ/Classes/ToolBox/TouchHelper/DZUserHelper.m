//
//  DZUserHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserHelper.h"
#import "DZInviteCodeView.h"

@implementation DZUserHelper


// 删除消息
+ (void)user_NotiCellDeleteAction:(NSString *)noti_id{
    
    [[DZNetCenter center] dzx_notiDeleteWithNoti:noti_id completion:^(BOOL success) {
        
        KSLog(@"WBS 通知删除 未实现呢======");
    }];
}

// 弹出用户邀请码
+ (void)user_createUserinviteCodeAction:(DZQBaseUserV1 *)userModel{
    if (!userModel || !userModel.user_id) {
        return;
    }
    [[DZNetCenter center] dzx_userinviteCodeWithSuccess:^(NSString * _Nonnull codeString) {
        if (codeString.length) {
            DZInviteCodeView *codeView = [[DZInviteCodeView alloc] initWithCode:codeString user:userModel];
            [[DZShadowAlertManager sharedManager] showScaleAlertView:codeView bDismiss:YES];
        }
    }];
}

/// 订单详情页
+ (void)user_orderDetailViewInfoAction:(DZQDataCashLog *)logModel{
    
    KSLog(@"WBS  跳转订单详情页");
    
}

// 关注
+ (void)user_HeaderCellFollowAction:(NSString *)user_id current:(BOOL)isFollow block:(backBoolBlock)backBlock{
    
    if (!user_id.length || !backBlock) {
        return;
    }
    
    if (isFollow) {
        [[DZNetCenter center] dzx_followShipDeleteWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (backBlock) {
                backBlock(YES);
            }
        }];
    }else{
        [[DZNetCenter center] dzx_followShipCreateWithUser:user_id completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
            if (backBlock) {
                backBlock(YES);
            }
        }];
    }
}


@end
