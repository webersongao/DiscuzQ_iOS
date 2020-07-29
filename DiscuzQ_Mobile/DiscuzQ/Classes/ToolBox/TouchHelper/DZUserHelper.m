//
//  DZUserHelper.m
//  DiscuzQ
//
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
+ (void)user_createUserinviteCodeAction:(DZQBaseUser *)userModel{
    
    [[DZNetCenter center] dzx_userinviteCodeWithSuccess:^(NSString * _Nonnull codeString) {
        
        DZInviteCodeView *codeView = [[DZInviteCodeView alloc] initWithCode:codeString user:userModel];
        [[DZShadowAlertManager sharedManager] showScaleAlertView:codeView bDismiss:YES];
    }];
}

/// 订单详情页
+ (void)user_orderDetailViewInfoAction:(DZQDataCashLog *)logModel{
    
    KSLog(@"WBS  跳转订单详情页");
    
}




@end
