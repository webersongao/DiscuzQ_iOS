//
//  DZQSiteV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZSiteSubV1.h"

@interface DZSite_setModel : NSObject

@property (nonatomic, copy) NSString *site_name;  //!< 属性注释
@property (nonatomic, copy) NSString *site_title;  //!< 属性注释
@property (nonatomic, copy) NSString *site_keywords;  //!< 属性注释
@property (nonatomic, copy) NSString *site_introduction;  //!< 属性注释
@property (nonatomic, copy) NSString *site_mode;  //!< public 公开模式 pay 付费模式
@property (nonatomic, copy) NSString *site_close_msg;  //!< 属性注释

@property (nonatomic, copy) NSString *open_ext_fields;  //!< 属性注释
@property (nonatomic, copy) NSArray<DZSite_manage *> *site_manage;  //!< 属性注释
@property (nonatomic, copy) NSString *api_freq;  //!< 属性注释
@property (nonatomic, copy) NSString *site_favicon;  //!< 属性注释

@property (nonatomic, copy) NSString *site_logo;  //!< 站点logo
@property (nonatomic, copy) NSString *site_header_logo;  //!< 站点 首页头部Logo
@property (nonatomic, copy) NSString *site_background_image;  //!< 站点背景图

@property (nonatomic, copy) NSString *site_url;  //!< 属性注释
@property (nonatomic, copy) NSString *site_stat;  //!< 属性注释

@property (nonatomic, strong) DZSite_author *site_author;  //!< 属性注释

@property (nonatomic, copy) NSString *site_install;  //!< 属性注释
@property (nonatomic, copy) NSString *site_record;  //!< 属性注释
@property (nonatomic, copy) NSString *site_cover;  //!< 属性注释

@property (nonatomic, assign) NSInteger site_record_code;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_onlooker_price;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_master_scale;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_pay_group_close;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_minimum_amount;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_open_sort;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread0;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread1;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread2;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread3;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread4;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread5;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_create_thread6;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_can_reward;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_skin;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_price;  //!< 属性注释
@property (nonatomic, assign) NSInteger site_expire;  //!< 属性注释


@end

@interface DZSite_regModel : NSObject

@property (nonatomic, assign) BOOL register_close;  //!< 是否允许注册
@property (nonatomic, assign) BOOL register_validate;  //!< 是否开启注册审核
@property (nonatomic, assign) BOOL register_captcha;  //!< 注册验证码
@property (nonatomic, assign) NSInteger password_length;  //!< 密码长度
@property (nonatomic, strong) NSArray<NSString *> *password_strength;  //!< 密码强度
@property (nonatomic, assign) NSInteger register_type;  //!< 注册模式 (0 用户名模式、1 手机号模式, 2 无感模式)

@end

@interface DZSite_passModel : NSObject

@property (nonatomic, assign) BOOL offiaccount_close;  //!< 微信 h5 登陆开关
@property (nonatomic, assign) BOOL miniprogram_close;  //!< 微信小程序登陆开关
@property (nonatomic, assign) BOOL oplatform_close;  //!< 微信 pc 登陆开关

@end

@interface DZSite_payModel : NSObject

@property (nonatomic, assign) BOOL wxpay_close;  //!< 微信支付开关
@property (nonatomic, assign) BOOL wxpay_ios;  //!< IOS 微信支付开关
@property (nonatomic, assign) BOOL wxpay_mchpay_close;  //!< 微信企业付款到零钱开关

@end

@interface DZSite_attachModel : NSObject

@property (nonatomic, copy) NSString *support_img_ext;  //!< 支持的 图片 扩展名
@property (nonatomic, copy) NSString *support_file_ext;  //!< 支持的 附件 扩展名
@property (nonatomic, assign) NSInteger support_max_size;  //!< 支持的最大大小 （单位 MB）

@end

@interface DZSite_qcloudModel : NSObject

@property (nonatomic, assign) BOOL qcloud_close;  //!< 云 api 开关
@property (nonatomic, copy) NSString *qcloud_app_id;  //!< 云 api-app_id
@property (nonatomic, assign) BOOL qcloud_cos;  //!< cos 开关

@property (nonatomic, assign) BOOL qcloud_captcha;  //!< 验证码开关
@property (nonatomic, copy) NSString *qcloud_captcha_app_id;  //!< 验证码开关 app_id

@property (nonatomic, assign) BOOL qcloud_faceid;  //!< 实名认证开关
@property (nonatomic, assign) BOOL qcloud_sms;  //!< 短信开关
@property (nonatomic, assign) BOOL qcloud_vod;  //!< 云点播开关
@property (nonatomic, assign) BOOL qcloud_cos_doc_preview;  //!< 是否开启文档预览

@property (nonatomic, copy) NSString *qcloud_vod_ext;  //!< 视频扩展名(WMV、RM、MOV、MPEG、MP4、3GP、FLV、AVI、RMVB 等)
@property (nonatomic, copy) NSString *qcloud_vod_size;  //!< 视频大小 (MB 单位)
@property (nonatomic, copy) NSString *qcloud_vod_sub_app_id;  //!<云点播子应用 appid

//https://console.cloud.tencent.com/vod/video-process/template/watermark 中的模板 ID
@property (nonatomic, copy) NSString *qcloud_vod_watermark;  //!<  视频水印模板 ID
@property (nonatomic, copy) NSString *qcloud_vod_token;  //!< 属性注释

@end

@interface DZSite_cashModel : NSObject

@property (nonatomic, assign) double cash_rate;  //!< 提现手续费率（百分之）
@property (nonatomic, assign) NSInteger cash_min_sum;  //!< 用户每次提现的最小金额

@end

@interface DZSite_otherModel : NSObject


@property (nonatomic, assign) NSUInteger count_threads;  //!< 属性注释
@property (nonatomic, assign) NSUInteger count_posts;  //!< 属性注释
@property (nonatomic, assign) NSUInteger count_users;  //!< 属性注释

@property (nonatomic, assign) BOOL can_edit_user_group;  //!< 属性注释
@property (nonatomic, assign) BOOL can_edit_user_status;  //!< 属性注释
@property (nonatomic, assign) BOOL can_view_threads;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_dialog;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_invite;  //!< 属性注释
@property (nonatomic, assign) BOOL can_invite_user_scale;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_paid;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_long;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_video;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_image;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_audio;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_question;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_goods;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_long_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_video_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_image_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_audio_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_question_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_goods_position;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_red_packet;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_long_red_packet;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_long_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_video_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_image_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_audio_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_question_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_goods_anonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_in_category;  //!< 属性注释
@property (nonatomic, assign) BOOL can_upload_attachments;  //!< 属性注释
@property (nonatomic, assign) BOOL can_upload_images;  //!< 属性注释
@property (nonatomic, assign) BOOL initialized_pay_password;  //!< 属性注释
@property (nonatomic, assign) BOOL can_be_onlooker;  //!< 属性注释
@property (nonatomic, assign) BOOL create_thread_with_captcha;  //!< 属性注释
@property (nonatomic, assign) BOOL publish_need_real_name;  //!< 属性注释
@property (nonatomic, assign) BOOL publish_need_bind_phone;  //!< 属性注释

@end


@interface DZSite_lbsModel : NSObject

@property (nonatomic, assign) BOOL lbs;  //!< 位置服务开关
@property (nonatomic, copy) NSString *qq_lbs_key;  //!< 腾讯位置服务 key

@end

@interface DZSite_ucenterModel : NSObject

@property (nonatomic, assign) BOOL ucenter;  //!< 属性注释

@end

@interface DZSite_signModel : NSObject

@property (nonatomic, assign) BOOL user_name;  //!< 属性注释
@property (nonatomic, assign) BOOL mobile_phone;  //!< 属性注释
@property (nonatomic, assign) BOOL wechat_direct;  //!< 属性注释

@end

@interface DZSite_userModel : NSObject

@property (nonatomic, strong) NSArray<DZSite_group *> *groups;  //!< 属性注释
@property (nonatomic, copy) NSString *register_time;  //!< 属性注释

@end




@interface DZQSiteV1 : DZQSuperAttribute

@property (nonatomic, strong) DZSite_setModel *set_site;  //!< 属性注释
@property (nonatomic, strong) DZSite_regModel *set_reg;  //!< 属性注释
@property (nonatomic, strong) DZSite_passModel *passport;  //!< 属性注释
@property (nonatomic, strong) DZSite_payModel *paycenter;  //!< 属性注释
@property (nonatomic, strong) DZSite_attachModel *set_attach;  //!< 属性注释
@property (nonatomic, strong) DZSite_qcloudModel *qcloud;  //!< 属性注释
@property (nonatomic, strong) DZSite_cashModel *set_cash;  //!< 属性注释
@property (nonatomic, strong) DZSite_otherModel *other;  //!< 属性注释
@property (nonatomic, strong) DZSite_lbsModel *lbs;  //!< 属性注释
@property (nonatomic, strong) DZSite_ucenterModel *ucenter;  //!< 属性注释
@property (nonatomic, strong) DZSite_signModel *sign_enable;  //!< 属性注释
@property (nonatomic, strong) DZSite_userModel *user;  //!< 属性注释

@end


