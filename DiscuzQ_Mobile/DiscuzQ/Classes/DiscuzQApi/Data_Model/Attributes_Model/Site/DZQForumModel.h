//
//  DZQForumModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZSite_setModel : NSObject

@property (nonatomic, copy) NSString *site_name;  //!< 属性注释
@property (nonatomic, copy) NSString *site_introduction;  //!< 属性注释
@property (nonatomic, copy) NSString *site_mode;  //!< 属性注释
@property (nonatomic, copy) NSString *site_close;  //!< 属性注释
@property (nonatomic, copy) NSString *site_logo;  //!< 属性注释
@property (nonatomic, copy) NSString *site_url;  //!< 属性注释
@property (nonatomic, copy) NSString *site_stat;  //!< 属性注释

@property (nonatomic, copy) NSDictionary *site_author;  //!< 属性注释

@property (nonatomic, copy) NSString *site_install;  //!< 属性注释
@property (nonatomic, copy) NSString *site_record;  //!< 属性注释
@property (nonatomic, copy) NSString *site_cover;  //!< 属性注释


@end

@interface DZSite_regModel : NSObject

@property (nonatomic, assign) BOOL register_close;  //!< 属性注释
@property (nonatomic, assign) BOOL register_validate;  //!< 属性注释
@property (nonatomic, assign) BOOL register_captcha;  //!< 属性注释
@property (nonatomic, assign) NSInteger password_length;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *password_strength;  //!< 属性注释

@end

@interface DZSite_passModel : NSObject

@property (nonatomic, assign) BOOL offiaccount_close;  //!< 属性注释
@property (nonatomic, assign) BOOL miniprogram_close;  //!< 属性注释
@property (nonatomic, assign) BOOL oplatform_close;  //!< 属性注释

@end

@interface DZSite_payModel : NSObject

@property (nonatomic, assign) BOOL wxpay_close;  //!< 属性注释

@end

@interface DZSite_attachModel : NSObject

@property (nonatomic, copy) NSString *support_img_ext;  //!< 属性注释
@property (nonatomic, copy) NSString *support_file_ext;  //!< 属性注释
@property (nonatomic, assign) NSInteger support_max_size;  //!< 属性注释

@end

@interface DZSite_qcloudModel : NSObject

@property (nonatomic, copy) NSString *qcloud_app_id;  //!< 属性注释
@property (nonatomic, assign) BOOL qcloud_close;  //!< 属性注释
@property (nonatomic, assign) BOOL qcloud_cos;  //!< 属性注释
@property (nonatomic, assign) BOOL qcloud_captcha;  //!< 属性注释

@property (nonatomic, copy) NSString *qcloud_captcha_app_id;  //!< 属性注释

@property (nonatomic, assign) BOOL qcloud_faceid;  //!< 属性注释
@property (nonatomic, assign) BOOL qcloud_sms;  //!< 属性注释
@property (nonatomic, assign) BOOL qcloud_vod;  //!< 属性注释


@property (nonatomic, copy) NSString *qcloud_vod_ext;  //!< 属性注释
@property (nonatomic, copy) NSString *qcloud_vod_size;  //!< 属性注释
@property (nonatomic, copy) NSString *qcloud_vod_sub_app_id;  //!< 属性注释



@end

@interface DZSite_cashModel : NSObject

@property (nonatomic, copy) NSString *cash_rate;  //!< 属性注释

@end

@interface DZSite_otherModel : NSObject


@property (nonatomic, assign) NSInteger count_threads;  //!< 属性注释
@property (nonatomic, assign) NSInteger count_posts;  //!< 属性注释
@property (nonatomic, assign) NSInteger count_users;  //!< 属性注释

@property (nonatomic, assign) BOOL can_upload_attachments;  //!< 属性注释
@property (nonatomic, assign) BOOL can_upload_images;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_video;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_thread_long;  //!< 属性注释
@property (nonatomic, assign) BOOL can_view_threads;  //!< 属性注释
@property (nonatomic, assign) BOOL can_batch_edit_threads;  //!< 属性注释
@property (nonatomic, assign) BOOL can_view_user_list;  //!< 属性注释
@property (nonatomic, assign) BOOL can_edit_user_group;  //!< 属性注释
@property (nonatomic, assign) BOOL can_create_invite;  //!< 属性注释
@property (nonatomic, assign) BOOL create_thread_with_captcha;  //!< 属性注释
@property (nonatomic, assign) BOOL initialized_pay_password;  //!< 属性注释


@end


@interface DZQForumModel : DZQSuperAttribute

@property (nonatomic, strong) DZSite_setModel *set_site;  //!< 属性注释
@property (nonatomic, strong) DZSite_regModel *set_reg;  //!< 属性注释
@property (nonatomic, strong) DZSite_passModel *passport;  //!< 属性注释
@property (nonatomic, strong) DZSite_payModel *paycenter;  //!< 属性注释
@property (nonatomic, strong) DZSite_attachModel *set_attach;  //!< 属性注释
@property (nonatomic, strong) DZSite_qcloudModel *qcloud;  //!< 属性注释
@property (nonatomic, strong) DZSite_cashModel *set_cash;  //!< 属性注释
@property (nonatomic, strong) DZSite_otherModel *other;  //!< 属性注释

@end


