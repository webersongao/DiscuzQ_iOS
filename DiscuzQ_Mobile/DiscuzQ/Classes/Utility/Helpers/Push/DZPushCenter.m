//
//  DZPushCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 19/12/25.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZPushCenter.h"
#import "UIAlertController+Extension.h"

@interface DZPushCenter()

@property (nonatomic, copy) NSString *xgts;

@end

@implementation DZPushCenter


+ (instancetype)Shared {
    static DZPushCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[DZPushCenter alloc] init];
    });
    return center;
}

///** 配置推送 */
- (void)configPush {

}
//
//#pragma mark - 收到推送后跳到某页
- (void)getNotiToview:(NSDictionary *)userInfo {
//    
//    KSLog(@"%@",userInfo);
//    //角标清0
//    [self cancelPushBadge];
}

// 本来就在前台的时候
- (void)isActivePushAlert:(NSDictionary *)userInfo {
    
//    KSLog(@"%@",userInfo);
//    NSDictionary *oneDict = [userInfo dictionaryForKey:@"aps"];
//    NSString *msg = [oneDict stringForKey:@"alert"];
//    NSDictionary *xgDic = [userInfo dictionaryForKey:@"xg"];
//    NSString *ts = [NSString stringWithFormat:@"%@",[xgDic objectForKey:@"ts"]];
//    if ([self.xgts isEqualToString:ts]) {
//        return;
//    }
//    self.xgts = ts;
//    
//    UITabBarController *tabbBarVC = (UITabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController;
//    UINavigationController *navVC = tabbBarVC.viewControllers.firstObject;
//    [UIAlertController alertTitle:nil message:msg controller:navVC doneText:@"去看看" cancelText:@"不了" doneHandle:^{
//        [self getNotiToview:userInfo];
//    } cancelHandle:^{
//        [self cancelPushBadge];
//    }];
}

/* 角标清0 */
- (void)cancelPushBadge {
    //角标清0
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}


#pragma mark - 信鸽注册
- (void)Reregistration {
    
//    [XGPush startApp:DZ_Push_APPID appKey:DZ_Push_APPKEY];
//    //注销之后需要再次注册前的准备
//    void (^successCallback)(void) = ^(void){
//        //如果变成需要注册状态
//        if(![XGPush isUnRegisterStatus])
//        {
//            //iOS8注册push方法
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
//            
//            float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
//            
//            if(sysVer < 8) {
//                [self registerPush];
//            }
//            else{
//                
//                [self registerPushForIOS8];
//                
//            }
//#else
//            //iOS8之前注册push方法 注册Push服务，注册后才能收到推送
//            [self registerPush];
//#endif
//        }
//    };
//    [XGPush initForReregister:successCallback];
}

//- (void)registerPushForIOS8{
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
//    
//    //Types
//    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//    //Actions
//    UIMutableUserNotificationAction * acceptAction = [[UIMutableUserNotificationAction alloc] init];
//    
//    acceptAction.identifier = @"ACCEPT_IDENTIFIER";
//    acceptAction.title = @"Accept";
//    acceptAction.activationMode = UIUserNotificationActivationModeForeground;
//    acceptAction.destructive = NO;
//    acceptAction.authenticationRequired = NO;
//    
//    //Categories
//    UIMutableUserNotificationCategory *inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
//    inviteCategory.identifier = @"INVITE_CATEGORY";
//    [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextDefault];
//    [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextMinimal];
//    
//    
//    NSSet *categories = [NSSet setWithObjects:inviteCategory, nil];
//    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
//    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
//    [[UIApplication sharedApplication] registerForRemoteNotifications];
//#endif
//}
//
- (void)receiveNotificationFeeback:(NSDictionary *)userInfo {
    // 回调版本示例
//    void (^successBlock)(void) = ^(void){
//        //成功之后的处理
//        KSLog(@"[XGPush]handleReceiveNotification successBlock");
//    };
//    
//    void (^errorBlock)(void) = ^(void){
//        //失败之后的处理
//        KSLog(@"[XGPush]handleReceiveNotification errorBlock");
//    };
//    
//    void (^completion)(void) = ^(void){
//        //失败之后的处理
//        KSLog(@"[xg push completion]userInfo is %@",userInfo);
//    };
//    // 推送反馈(app在运行时),支持回调版本
//    [XGPush handleReceiveNotification:userInfo successCallback:successBlock errorCallback:errorBlock completion:completion];
}

//- (void)registerPush{
//    
////    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
//}


@end





