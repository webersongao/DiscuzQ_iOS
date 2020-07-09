//
//  const.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

// 常量文件

typedef NS_ENUM(NSUInteger, PostType) {
    post_normal,
    post_vote,
    post_activity,
    post_debate,
};

typedef void(^PRStateBlock)(id data,BOOL bSuccess);

#define KRoot_Domainkey     @"root_domain"

#define KTest_UserName     @"iOSUser"
#define KTest_PassWord     @"dz516680"


#define KError_NetNil      @"网络异常，请稍后再试"
#define KError_DataNil     @"数据异常，请稍后再试"
/// 播放器view的tag，列表中UI控件唯一tag值
#define kPlayerViewTag      20070301
#define KShadowAlert_Tag    18111301 // 通用的 ShadowAletView 的弹窗默认tag
