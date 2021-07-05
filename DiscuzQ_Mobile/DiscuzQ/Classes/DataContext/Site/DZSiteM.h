//
//  DZSiteM.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootModel.h"
#import "DZSiteSubM.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSiteSetM : NSObject

@property (nonatomic, copy) NSString *siteName;  //!< 属性注释
@property (nonatomic, copy) NSString *siteTitle;  //!< 属性注释
@property (nonatomic, copy) NSString *siteKeywords;  //!< 属性注释
@property (nonatomic, copy) NSString *siteIntroduction;  //!< 属性注释
@property (nonatomic, copy) NSString *siteMode;  //!< public 公开模式 pay 付费模式
@property (nonatomic, assign) BOOL siteClose;  //!< 属性注释
@property (nonatomic, copy) NSString *siteCloseMsg;  //!< 属性注释
@property (nonatomic, copy) NSString *openExtFields;  //!< 属性注释
@property (nonatomic, copy) NSArray<DZSiteManageM *> *siteManage;  //!< 属性注释
@property (nonatomic, copy) NSString *apiFreq;  //!< 属性注释
@property (nonatomic, copy) NSString *siteFavicon;  //!< 属性注释

@property (nonatomic, copy) NSString *siteLogo;  //!< 站点logo
@property (nonatomic, copy) NSString *siteHeaderLogo;  //!< 站点 首页头部Logo
@property (nonatomic, copy) NSString *siteBackgroundImage;  //!< 站点背景图

@property (nonatomic, copy) NSString *siteUrl;  //!< 属性注释
@property (nonatomic, copy) NSString *siteStat;  //!< 属性注释

@property (nonatomic, strong) DZSiteAuthorM *siteAuthor;  //!< 属性注释

@property (nonatomic, copy) NSString *siteInstall;  //!< 属性注释
@property (nonatomic, copy) NSString *siteRecord;  //!< 属性注释
@property (nonatomic, copy) NSString *siteCover;  //!< 属性注释

@property (nonatomic, copy) NSString *siteRecordCode;  //!< 属性注释
@property (nonatomic, copy) NSString *siteMasterScale;  //!< 属性注释

@property (nonatomic, copy) NSString *sitePayGroupClose;  //!< 属性注释
@property (nonatomic, copy) NSString *siteMinimumAmount;  //!< 属性注释

@property (nonatomic, assign) NSInteger siteOpenSort;  //!< 属性注释
@property (nonatomic, assign) BOOL siteCanReward;  //!< 属性注释


@end

@interface DZSiteRegM : NSObject

@property (nonatomic, assign) BOOL registerClose;  //!< 是否允许注册
@property (nonatomic, assign) BOOL registerValidate;  //!< 是否开启注册审核
@property (nonatomic, assign) BOOL registerCaptcha;  //!< 注册验证码
@property (nonatomic, assign) NSInteger passwordLength;  //!< 密码长度
@property (nonatomic, strong) NSArray<NSString *> *passwordStrength;  //!< 密码强度
@property (nonatomic, assign) NSInteger registerType;  //!< 注册模式 (0 用户名模式、1 手机号模式, 2 无感模式)
@property (nonatomic, assign) BOOL isNeedTransition;  //!< 是否允许注册

@end

@interface DZSitePassM : NSObject

@property (nonatomic, assign) BOOL offiaccountOpen;  //!< 微信 h5 登陆开关
@property (nonatomic, assign) BOOL miniprogramOpen;  //!< 微信小程序登陆开关

@end

@interface DZSitePayM : NSObject

@property (nonatomic, assign) BOOL wxpayClose;  //!< 微信支付开关
@property (nonatomic, assign) BOOL wxpayIos;  //!< IOS 微信支付开关
@property (nonatomic, assign) BOOL wxpayMchpayClose;  //!< 微信企业付款到零钱开关

@end

@interface DZSiteAttachM : NSObject

@property (nonatomic, copy) NSString *supportImgExt;  //!< 支持的 图片 扩展名
@property (nonatomic, copy) NSString *supportFileExt;  //!< 支持的 附件 扩展名
@property (nonatomic, copy) NSString *supportMaxSize;  //!< 支持的最大大小 （单位 MB）

@end

@interface DZSiteQCloudM : NSObject

@property (nonatomic, copy) NSString *qcloudAppId;  //!< 云 api-app_id
@property (nonatomic, assign) BOOL qcloudClose;  //!< 云 api 开关
@property (nonatomic, assign) BOOL qcloudCos;  //!< cos 开关

@property (nonatomic, assign) BOOL qcloudCaptcha;  //!< 验证码开关
@property (nonatomic, copy) NSString *qcloudCaptchaAppId;  //!< 验证码开关 app_id

@property (nonatomic, assign) BOOL qcloudFaceid;  //!< 实名认证开关
@property (nonatomic, assign) BOOL qcloudSms;  //!< 短信开关
@property (nonatomic, assign) BOOL qcloudVod;  //!< 云点播开关
@property (nonatomic, assign) BOOL qcloudCosDocPreview;  //!< 是否开启文档预览

@property (nonatomic, copy) NSString *qcloudVodExt;  //!< 视频扩展名(WMV、RM、MOV、MPEG、MP4、3GP、FLV、AVI、RMVB 等)
@property (nonatomic, copy) NSString *qcloudVodSize;  //!< 视频大小 (MB 单位)
@property (nonatomic, copy) NSString *qcloudVodSubAppId;  //!<云点播子应用 appid

//https://console.cloud.tencent.com/vod/video-process/template/watermark 中的模板 ID
@property (nonatomic, copy) NSString *qcloudVodWatermark;  //!<  视频水印模板 ID
@property (nonatomic, copy) NSString *qcloudVodToken;  //!< 属性注释

@end

@interface DZSiteCashM : NSObject

@property (nonatomic, copy) NSString *cashRate;  //!< 提现手续费率（百分之）
@property (nonatomic, copy) NSString *cashMinSum;  //!< 用户每次提现的最小金额

@end

@interface DZSiteOtherM : NSObject

@property (nonatomic, assign) NSUInteger countThreads;  //!< 属性注释
@property (nonatomic, assign) NSUInteger countPosts;  //!< 属性注释
@property (nonatomic, assign) NSUInteger countUsers;  //!< 属性注释

@property (nonatomic, assign) BOOL canEditUserGroup;  //!< 属性注释
@property (nonatomic, assign) BOOL canEditUserStatus;  //!< 属性注释
@property (nonatomic, assign) BOOL canCreateThreadInCategory;  //!< 属性注释
@property (nonatomic, assign) BOOL canFreeViewPaidThreads;  //!< 属性注释
@property (nonatomic, assign) BOOL canCreateDialog;  //!< 属性注释
@property (nonatomic, assign) BOOL canInviteUserScale;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadAttachment;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadPaid;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadVideo;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadImage;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadAudio;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadGoods;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadPosition;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadRedPacket;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadReward;  //!< 属性注释
@property (nonatomic, assign) BOOL canInsertThreadAnonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL initializedPayPassword;  //!< 属性注释
@property (nonatomic, assign) BOOL createThreadWithCaptcha;  //!< 属性注释
@property (nonatomic, assign) BOOL publishNeedBindPhone;  //!< 属性注释

@end


@interface DZSiteLbsM : NSObject

@property (nonatomic, assign) BOOL lbs;  //!< 位置服务开关
@property (nonatomic, copy) NSString *qqLbsKey;  //!< 腾讯位置服务 key

@end

@interface DZSiteUCenterM : NSObject

@property (nonatomic, assign) BOOL ucenter;  //!< 属性注释

@end

@interface DZSiteAgreeM : NSObject

@property (nonatomic, assign) BOOL privacy;  //!< 属性注释
@property (nonatomic, copy) NSString *privacyContent;  //!< 属性注释
@property (nonatomic, assign) BOOL isRegister;  //!< 属性注释
@property (nonatomic, copy) NSString *registerContent;  //!< 属性注释


@end



@interface DZSiteM : DZRootModel

@property (nonatomic, strong) DZSiteSetM *setSite;  //!< 属性注释
@property (nonatomic, strong) DZSiteRegM *setReg;  //!< 属性注释
@property (nonatomic, strong) DZSitePassM *passport;  //!< 属性注释
@property (nonatomic, strong) DZSitePayM *paycenter;  //!< 属性注释
@property (nonatomic, strong) DZSiteAttachM *setAttach;  //!< 属性注释
@property (nonatomic, strong) DZSiteQCloudM *qcloud;  //!< 属性注释
@property (nonatomic, strong) DZSiteCashM *setCash;  //!< 属性注释
@property (nonatomic, strong) DZSiteOtherM *other;  //!< 属性注释
@property (nonatomic, strong) DZSiteLbsM *lbs;  //!< 属性注释
@property (nonatomic, strong) DZSiteUCenterM *ucenter;  //!< 属性注释
@property (nonatomic, strong) DZSiteAgreeM *agreement;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
