//
//  DZErrorFormarter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZErrorFormarter.h"
#import "DZQErrorV1.h"

@interface DZErrorFormarter ()

@property (nonatomic, strong) NSDictionary *innnerErrorDictionary;  //!< 属性注释

@end

@implementation DZErrorFormarter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initDefaultdescription];
    }
    return self;
}


-(void)initDefaultdescription{
    
    _errorDictionary = self.innnerErrorDictionary;
}

-(NSString *)formartErrorModel:(DZQErrorV1 *)errorModel{
    
    NSString *detailStr = [self.errorDictionary objectForKey:errorModel.code];
    
    if (detailStr.length) {
        if (errorModel.errorDetailStr.length) {
            errorModel.errorDetailStr = [errorModel.errorDetailStr stringByAppendingString:checkStr(detailStr)];
        }else{
            errorModel.errorDetailStr = detailStr;
        }
    }
    
    return detailStr;
}




-(NSDictionary *)innnerErrorDictionary{
    if (!_innnerErrorDictionary) {
        // 1、异常处理的抛出错误
        _innnerErrorDictionary = @{@"unknown_error" : DZQTwoErrorStr(@"500-", @"未知错误(公共错误名)"),
                             @"category_not_found" : DZQTwoErrorStr(@"500-", @"分类未找到"),
                             @"censor_not_passed" : DZQTwoErrorStr(@"500-", @"检查未通过"),
                             @"sms_interval" : DZQTwoErrorStr(nil, @"短信间隔错误"),
                             @"model_not_found" : DZQTwoErrorStr(@"404-", @"模型未找到"),
                             @"route_not_found" : DZQTwoErrorStr(@"404-", @"路由未找到"),
                             @"no_bind_user" : DZQTwoErrorStr(@"400-", @"未绑定用户"),
                             @"rebind_mp_wechat" : DZQTwoErrorStr(@"400-", @"更换微信公众号绑定"),
                             @"sms_verify_error" : DZQTwoErrorStr(nil, @"短信验证错误"),
                             @"thread_count_fail" : DZQTwoErrorStr(nil, @"主题数操作错误"),
                             @"thread_behavior_fail" : DZQTwoErrorStr(nil, @"主题状态异常"),
                             @"thread_action_fail" : DZQTwoErrorStr(nil, @"主题操作异常"),
                             @"update_permission_error" : DZQTwoErrorStr(@"404", nil),
                             @"upload_error" : DZQTwoErrorStr(@"404-", @"上传图片失败"),
                             @"file_not_allow" : DZQTwoErrorStr(@"", @"不支持文件"),
                             @"scale_sum_not_10" : DZQTwoErrorStr(nil, @"分成比例相加必须为 10"),
                             @"cannot_delete_category_with_threads" : DZQTwoErrorStr(nil, @"无法删除存在主题的分类"),
                             @"cannot_create_image_thread_without_attachments" : DZQTwoErrorStr(nil, @"发表图片帖必须带有图片"),
                             @"user_update_error" : DZQTwoErrorStr(nil, @"修改信息失败"),
                             @"uninitialized_pay_password" : DZQTwoErrorStr(nil, @"未初始化支付密码"),
                             @"invalid_emoji_path" : DZQTwoErrorStr(nil, @"无效的表情目录"),
                             @"cannot_create_thread_without_goods" : DZQTwoErrorStr(nil, @"发表商品帖必须带有商品"),
                             @"post_goods_illegal" : DZQTwoErrorStr(nil, @"商品不合法"),
                             @"pc_qrcode_scanning_code" : DZQTwoErrorStr(nil, @"扫码中"),
                             @"pc_qrcode_time_out" : DZQTwoErrorStr(nil, @"二维码已失效，扫码超时"),
                             @"pc_qrcode_time_fail" : DZQTwoErrorStr(nil, @"扫码登陆失败"),
                             @"pc_qrcode_error" : DZQTwoErrorStr(nil, @"二维码 code 错误"),
                             /// 2、代码中的抛出错误
                             @"upload_time_not_up" : DZQTwoErrorStr(@"404-", @"一天仅允许修改一次头像"),
                             @"wallet_error" : DZQTwoErrorStr(@"", @""),
                             @"validation_error" : DZQTwoErrorStr(@"422-", @"表单验证错误"),
                             @"permission_denied" : DZQTwoErrorStr(@"401-", @"没有权限"),
                             @"ban_user" : DZQTwoErrorStr(@"401-", @"您的账号被禁用，无法访问本站点"),
                             @"register_validate" : DZQTwoErrorStr(@"401-", @"帐号审核中，请审核通过后尝试"),
                             @"register_close" : DZQTwoErrorStr(@"401-", @"注册关闭"),
                             @"validate_ignore" : DZQTwoErrorStr(@"401-", @"帐号审核忽略，请联系管理员"),
                             @"validate_reject" : DZQTwoErrorStr(@"401-", @"帐号审核拒绝，请联系管理员"),
                             @"user_deny" : DZQTwoErrorStr(@"401-", @"您在对方的黑名单中"),
                             @"not_authenticated" : DZQTwoErrorStr(@"", @""),
                             @"file_type_not_allow" : DZQTwoErrorStr(@"", @"文件类型不允许"),
                             @"file_size_not_allow" : DZQTwoErrorStr(@"", @"文件大小不允许"),
                             @"content_banned" : DZQTwoErrorStr(@"", @""),
                             @"login_failed" : DZQTwoErrorStr(@"403-", @"帐号或密码错误"),
                             @"login_failures_times_toplimit" : DZQTwoErrorStr(@"402-", @"密码错误次数达到 5 次，请 15 分钟后再次尝试"),
                             @"Cannot delete the default group" : DZQTwoErrorStr(@"", @""),
                             @"No Qcloud Service was specified." : DZQTwoErrorStr(@"", @""),
                             @"File must be readable." : DZQTwoErrorStr(@"", @""),
                             @"trade_error" : DZQTwoErrorStr(@"500-", @"交易错误"),
                             @"order_post_not_found" : DZQTwoErrorStr(@"500-", @"订单错误"),
                             @"order_type_error" : DZQTwoErrorStr(@"500-", @"订单错误"),
                             @"order_create_failure" : DZQTwoErrorStr(@"500-", @"订单错误"),
                             @"order_amount_error" : DZQTwoErrorStr(@"500-", @"提现错误"),
                             @"operate_type_error" : DZQTwoErrorStr(@"500-", @"钱包错误"),
                             @"wallet_status_error" : DZQTwoErrorStr(@"500-", @"钱包错误"),
                             @"operate_forbidden" : DZQTwoErrorStr(@"500-", @"提现审核错误"),
                             @"available_amount_error" : DZQTwoErrorStr(@"500-", @"提现错误"),
                             @"cash_interval_time" : DZQTwoErrorStr(@"500-", @"提现错误"),
                             @"cash_sum_limit" : DZQTwoErrorStr(@"500-", @"提现错误"),
                             @"status_cash_freeze" : DZQTwoErrorStr(@"500-", @"提现错误"),
                             @"mobile_is_already_bind" : DZQTwoErrorStr(@"500-", @"手机号码已存在"),
                             @"user_has_mobile" : DZQTwoErrorStr(@"500-", @"用户已绑定手机号"),
                             @"post_not_comment" : DZQTwoErrorStr(@"500-", @"不能回复，回复回帖的内容"),
                             @"post_not_fond" : DZQTwoErrorStr(@"500-", @"未查询到该条回复"),
                             @"setting_fill_register_reason" : DZQTwoErrorStr(@"500-", @"注册时的注册原因必须必填"),
                             @"notification_is_missing_template_config" : DZQTwoErrorStr(@"500-", @"微信推送信息不全"),
                             @"tencent_secret_key_error" : DZQTwoErrorStr(@"500-", @"腾讯云 Secretid 或 SecretKey 不正确"),
                             @"tencent_vod_transcode_error" : DZQTwoErrorStr(@"500-", @"腾讯云云点播转码模板未设置"),
                             @"tencent_vod_subappid_error" : DZQTwoErrorStr(@"500-", @"腾讯云云点播子应用错误"),
                             @"pay_password_failures_times_toplimit" : DZQTwoErrorStr(@"500-", @"您输入的密码错误次数已超限，请在次日重试或重置"),
                             @"bind_error" : DZQTwoErrorStr(@"500-", @"小程序登录时，绑定用户被删除"),
                             @"wechat_mobile_unbound" : DZQTwoErrorStr(@"500-", @"微信未绑定手机号"),
                             @"unable_to_get_location" : DZQTwoErrorStr(@"404-", @"无法获取地理位置"),
                             @"qcloud_file_preview_unset" : DZQTwoErrorStr(@"500-", @"腾讯云对象存储文件预览未开启"),
        };
    }
    return _innnerErrorDictionary;
}



@end
