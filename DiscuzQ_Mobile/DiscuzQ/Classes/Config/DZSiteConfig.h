//
//  BaseConfig.h
//  DiscuzQ
//
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


#ifdef MACRO_PRODUCT //线上环境
#define KDebug_Color    KWhite_Color
#define DZQ_BASEURL      @"https://discuz.chat"
//#define DZQ_BASEURL      @"https://www.bushcraftcn.com"

#else //测试环境

#define KDebug_Color    KRandom_Color
#define DZQ_BASEURL      @"https://discuz.chat"
//#define DZQ_BASEURL      @"https://www.bushcraftcn.com"
#endif



#define DZQ_icon        @"discuz_circle_logo"
#define DZQ_Cor_icon    @"discuz_cor_logo"

#define DZ_company_Name  @"北京抖猫科技有限公司" // 公司
#define DZ_APP_Name      @"抖猫社区"
#define DZ_Empty_image   @"empty_icon" // 无数据显示图片
#define DZ_Logo_image    @"" // @"DZQ_logo" // 登录、注册页APP名称图片
#define DZ_Main_Color    KGreen_Color // 主题色 mRGBColor(220, 130, 0)
#define DZ_bbs_rule      checkTwoStr(@"bbsrule_", @"discuz") // 网站服务条款txt名字
#define DZ_Navi_Logo      checkTwoStr(DZQ_BASEURL, @"/static/images/logo.png") // 网站默认Logo
#define DZ_CopyRight      [NSString stringWithFormat:@"Copyright ©2001 - %@ doumao.cn.",KNowYear] // 版权时间

/** App id */
#define DZ_APPStore_id  @"1011658227"
// appStore地址
#define DZ_StorePath @"https://itunes.apple.com/cn/app/id1011658227"
// 版本检测
#define DZ_VersionCheck @"https://itunes.apple.com/lookup?id=1011658227"
// 版本升级
#define DZ_AppUpdatepath @"https://itunes.apple.com/us/app/id1011658227?mt=8"

// 邮箱
#define DeveloperEmail  @"gao@bkbt.org"
#define KdefaultAlert   @"网络异常，请稍后重试"
#define kDeafultCover   [UIImage imageNamed:@"discuz_circle_logo"]

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
#define DZ_Push_APPID     2200197269
#define DZ_Push_APPKEY    @""


#endif

