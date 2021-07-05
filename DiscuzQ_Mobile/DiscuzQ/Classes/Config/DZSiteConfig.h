//
//  BaseConfig.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

// 配置文件
#ifndef BaseConfig_h
#define BaseConfig_h

#pragma mark - 不同的项目在这里配置 ========================

/*
 *  BaseUrl设置 打开 1为生产环境，注释为测试环境
 */

#define MACRO_PRODUCT 1


#ifdef MACRO_PRODUCT    //线上环境
#define KDebug_Color    KWhite_Color
#define DZQ_BASEURL     [DZMobileCtrl siteRootDomain]

#else //测试环境

#define KDebug_Color    KRandom_Color
#define DZQ_BASEURL     DZQ_DefaultURL

#endif


// 默认站点网站
#define DZQ_DefaultURL   @"https://discuz.chat"
#define DZQ_DefaultURL_bcman   @"https://www.bcman.cn"
#define DZQ_DefaultURL_doucha   @"https://m.doucha.com"

#define DZQ_icon        @"dz_logo_circle"  // 70
#define DZQ_Cor_icon    @"dz_logo_banCircle"  // 150
#define DZQ_Tab_icon    @"dz_tab_logo"  // 50
#define DZQ_Square_icon  @"dz_logo_square"  // 190

#define DZQ_SDKVersion   1.0  // SDK支持的api版本号
#define DZ_APP_Name      @"迪斯卡斯"
#define DZ_company_Name  @"天津抖猫科技有限公司" // 公司
#define DZ_UserSignture  @"迪斯卡斯 - 彪悍的人生，不需要解释" // 默认签名
#define DZ_Empty_image   @"empty_icon" // 无数据显示图片
#define DZ_Logo_image    DZQ_Square_icon // 登录、注册页APP名称图片
#define DZ_Main_Color    KGreen_Color // 主题色 mRGBColor(220, 130, 0)
#define DZ_bbs_rule      checkTwoStr(@"bbsrule_", @"discuz") // 网站服务条款txt名字
#define DZ_Navi_icon      checkTwoStr(DZQ_BASEURL, @"/favicon.ico") // 网站默认 icon
#define DZ_CopyRight      [NSString stringWithFormat:@"Copyright ©2001 - %@ disikasi.com.",KNowYear] // 版权时间

/** App id */
#define DZ_APPStore_id  @"id1566826317"
// appStore地址
#define DZ_StorePath @"https://itunes.apple.com/cn/app/id1566826317"
// 版本检测
#define DZ_VersionCheck @"https://itunes.apple.com/lookup?id=1566826317"
// 版本升级
#define DZ_AppUpdatepath @"https://itunes.apple.com/us/app/id1566826317?mt=8"

// 邮箱
#define DeveloperEmail  @"gao@bkbt.org"
#define KdefaultAlert   @"网络异常，请稍后重试"
#define kDeafultCover   [UIImage imageNamed:@"dz_logo_circle"]

#pragma mark   /********* 第三方 *********/

// QQ 
#define DZ_QQ_APPID     @""
#define DZ_QQ_APPKEY    @""
// 微信
#define DZ_WX_APPID     @""
#define DZ_WX_APPSECRET     @""
// 腾讯旗下 QQ 微信的 通用跳转链接
#define DZ_QQ_UniLink   @"www.baidu.com"

// 微博
#define DZ_WB_APPID     @""
#define DZ_WB_APPSECRET     @""
#define DZ_WB_REDIRRCTURI   @"https://www.baidu.com"

// 推送
#define DZ_PushTOKEN      @"XGTOKEN"
#define DZ_Push_APPID     2200347269
#define DZ_Push_APPKEY    @""


// 友盟
#define DZ_UMeng_AppKey      @"5f83cfc65s4846f78a96fefde"

//  pod 'WHToast'
//  pod 'JJException'
//  pod 'JPImageresizerView'
//  iconFont 在iOS中的应用
//  https://www.jianshu.com/p/3b10bb95b332

#endif

