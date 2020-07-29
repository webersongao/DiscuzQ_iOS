//
///  DZQURLString.h
///  DiscuzQ
//
///  Created by WebersonGao on 2020/5/9.
///  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRBaiduHttpClient.h"
#import "DZQMacroHeader.h"
#import "DZToolBox.h"

//=========== 站点 =========

/// 前端获取配置接口
static NSString * DZQ_Site_forum =  @"/api/forum";
///// 站点 基本信息接口
//static NSString * DZQ_Site_siteInfo =  @"/siteinfo";
/// 上传、删除 站点logo
//static NSString * DZQ_Site_setlogo =  @"/api/settings/logo";
///// 检查更新
//static NSString * DZQ_Site_check =  @"/api/check";


//=========== 用户 =========

///// 用户批量删除接口
//static NSString * DZQ_Site_check =        @"/api/check";
/// 上传 头像接口
static NSString * DZQ_User_UpAvatar =     @"/api/users";
/// 删除 头像接口
//static NSString * DZQ_User_Delavatar =    @"/api/users";
/// 用户资料修改
static NSString * DZQ_User_modify =       @"/api/users";
///// 批量修改用户的用户组
//static NSString * DZQ_User_patchModify =  @"/api/users";
/// 用户资料展示
static NSString * DZQ_User_profile =      @"/api/users";
/// 用户搜索接口
static NSString * DZQ_User_search =       @"/api/users";
/// 实名认证接口
static NSString * DZQ_User_real =         @"/api/users/real";
/// 用户信息导出
//static NSString * DZQ_User_export =       @"/api/export/users?ids";
///// 删除用户微信信息
//static NSString * DZQ_Site_check =        @"/api/check";
/// 修改支付密码 - 获取验证 token
static NSString * DZQ_User_resetPayPwd =  @"/api/users/pay-password/reset";
/// 拉黑某个用户
static NSString * DZQ_User_deny =         @"/api/users";
/// 取消拉黑用户
static NSString * DZQ_User_cancelDeny =   @"/api/users";
/// 用户拉黑列表
static NSString * DZQ_User_denyList =     @"/api/users";


//=========== 用户认证 =========

/// 用户注册
static NSString * DZQ_User_register =       @"/api/register";
/// 用户登录
static NSString * DZQ_User_login =          @"/api/login";
///// 微信登录
//static NSString * DZQ_User_wechat =         @"/oauth/wechat";
///// 微信公众号通过 code 参数换取 token 接口
//static NSString * DZQ_User_wechat_User =    @"/api/oauth/wechat/user";
///// 微信小程序登录
//static NSString * DZQ_Site_check =          @"/oauth/wechat/miniprogram";
///// 小程序码
//static NSString * DZQ_Site_check =          @"/api/oauth/wechat/miniprogram/code";
///// 微信PC登录
//static NSString * DZQ_Site_check =          @"/oauth/wechat/pc";
///// 微信开放平台通过 code 参数换取 token 接口
//static NSString * DZQ_Site_check =          @"/api/oauth/wechat/pc/user";
///// PC微信扫码登录微信服务器返回信息接口
//static NSString * DZQ_Site_check =          @"/api/oauth/wechat/web/user/event";
///// PC微信扫码登录生成二维码接口
//static NSString * DZQ_Site_check =          @"/api/oauth/wechat/web/user";
///// PC微信扫码登录查询用户扫码状态接口
//static NSString * DZQ_Site_check =          @"/api/oauth/wechat/web/user/serach";
///// 企业微信登录
//static NSString * DZQ_User_Wxqy =           @"/api/oauth/wechat/qy";
///// 企业微信通过 code 参数换取 token 接口
//static NSString * DZQ_User_Wxqy_User =      @"/api/oauth/wechat/qy/user";
///// QQ登录
//static NSString * DZQ_User_QQ =             @"/api/oauth/qq";
///// QQ登录参数换取token接口
//static NSString * DZQ_User_QQ_User =        @"/api/oauth/qq/user";
/// 用户刷新 token 接口
static NSString * DZQ_User_refreshToken =   @"/api/refresh-token";


//=========== 用户组 =========

///// 添加 用户组
//static NSString * DZQ_Group_list =        @"/groups";
///// 用户组单条删除接口
//static NSString * DZQ_Group_list =        @"/api/groups";
///// 用户组批量删除接口
//static NSString * DZQ_Group_list =        @"/api/groups";
///// 用户组单条修改
//static NSString * DZQ_Group_list =        @"/api/groups";
///// 用户组多条修改
//static NSString * DZQ_Group_list =        @"/api/groups";
///// 查询用户组接口[单条]
//static NSString * DZQ_Group_list =        @"/api/groups";
/// 获取所有用户组
static NSString * DZQ_Group_list =        @"api/groups";



//=========== 权限 =========
///// 修改用户组权限接口
//static NSString * DZQ_User_GroupsPermission =  @"/api/permission";



//=========== 通知 =========
/// 查询通知[单个/批量]
static NSString * DZQ_Noti_list =  @"/api/notification";
/// 删除通知[单个/批量]
static NSString * DZQ_Noti_Del =  @"/api/notification";
///// 查询、修改 系统消息模版列表
//static NSString * DZQ_Noti_tpl =  @"/api/notification/tpl";




// //=========== 分类 =========
// /// 创建分类接口[单条]
//static NSString * DZQ_Cate_list =  @"/api/check";
// /// 创建分类接口[多条]
//static NSString * DZQ_Cate_list =  @"/api/check";
// /// 删除分类接口[单个]
//static NSString * DZQ_Cate_list =  @"/api/check";
// /// 删除主题接口[批量]
//static NSString * DZQ_Cate_list =  @"/api/check";
// /// 修改分类接口[单条]
//static NSString * DZQ_Cate_list =  @"/api/check";
// /// 修改分类接口[多条]
//static NSString * DZQ_Cate_list =  @"/api/check";
/// 查询分类接口[列表]
static NSString * DZQ_Cate_list =  @"/api/categories";




//=========== 主题 =========
///// 创建主题接口
static NSString * DZQ_Thread_create =  @"/api/threads";
///// 创建主题视频接口  （用作前端上传后回调。供后续视频清理使用）
static NSString * DZQ_Thread_video =  @"/api/thread/video";
///// 删除主题接口[单个]
static NSString * DZQ_Thread_delete =  @"/api/threads";
///// 删除主题接口[批量]
//static NSString * DZQ_Thread_check =  @"/api/check";
///// 修改主题接口[单条]
static NSString * DZQ_Thread_reset =  @"/api/threads";
///// 修改主题接口[批量]
//static NSString * DZQ_Site_check =  @"/api/check";
/// 查询主题接口[单条]
static NSString * DZQ_Thread_one =     @"/api/threads";
/// 查询主题接口[列表]
static NSString * DZQ_Thread_list =    @"/api/threads";
/// 查询我收藏的主题接口[列表]
static NSString * DZQ_Thread_favorites =  @"/api/favorites";
/// 分享主题时获取主题信息接口[单条]
static NSString * DZQ_Thread_Share =  @"/api/threads/share";
/// 查询用户点赞的主题列表接口[列表]
static NSString * DZQ_Thread_likes =  @"/api/threads/likes";
/// 创建云点播前端上传签名
static NSString * DZQ_Thread_signature =  @"/api/signature";





//=========== 回复 =========
///// 删除回复接口[批量]
//static NSString * DZQ_Post_check =  @"/api/posts/batch";
///// 修改回复接口[批量]
//static NSString * DZQ_Post_check =  @"/api/posts/batch";
///// 创建回复接口
static NSString * DZQ_Post_create =  @"/api/posts";
/// 删除回复接口[单个]
static NSString * DZQ_Post_delete =  @"/api/posts";
/// 查询回复接口[列表]
static NSString * DZQ_Post_list =  @"/api/posts";
///// 修改回复接口[单条]
static NSString * DZQ_Post_reset =  @"/api/posts";
/// 查询我点赞的帖子(回复)接口[列表]
static NSString * DZQ_Post_like =  @"/api/likes";

//=========== 附件 =========
/// 上传附件接口
static NSString * DZQ_Attach_upload =  @"/api/attachments";
/// 删除附件接口[单个]
static NSString * DZQ_Attach_delete =  @"/api/attachments";





//=========== 敏感词 =========（站长管理员权限）
///// 创建敏感词接口[单条]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 创建敏感词接口[批量]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 删除敏感词接口[单个/批量]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 修改敏感词接口
//static NSString * DZQ_Site_check =  @"/api/check";
///// 查询敏感词接口[单条]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 查询敏感词接口[列表]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 导出敏感词接口
//static NSString * DZQ_Site_check =  @"/api/check";



//=========== 举报 =========
/// 创建举报数据
static NSString * DZQ_Reports_create =  @"/api/reports";
///// 举报列表数据
//static NSString * DZQ_Site_check =  @"/api/check";
///// 批量删除举报
//static NSString * DZQ_Site_check =  @"/api/check";
///// 批量修改举报
//static NSString * DZQ_Site_check =  @"/api/check";



//=========== 表情 =========
/// 表情[列表]
static NSString * DZQ_Emoji_list =  @"/api/emoji";
///// 表情自动加载更新（下载所有表情包）
//static NSString * DZQ_Emoji_load =  @"/api/emojiLoad";



////=========== 邀请 =========
///// 管理员创建一码一用邀请码
//static NSString * DZQ_Invite_admin =  @"/api/invite";
/// 普通用户创建邀请码
static NSString * DZQ_Invite_user =  @"/api/userInviteCode";
///// 删除邀请码[单个]---删除管理员一码一用邀请码[单个]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 管理员邀请码[列表]
//static NSString * DZQ_Site_check =  @"/api/check";




////=========== 订单 =========
///// 支付订单
//static NSString * DZQ_Order_Pay =  @"//api/trade/pay/order/{order_sn}";
///// 创建订单
//static NSString * DZQ_Order_create =  @"/api/orders";
/// 订单列表
static NSString * DZQ_Order_List =  @"/api/orders";
/// 查询订单（单条）
static NSString * DZQ_Order_One =  @"/api/orders";



////=========== 钱包 =========
///// 提现申请
static NSString * DZQ_Wallet_withdraw =      @"/api/wallet/cash?include={user,userWallet}";
///// 提现审核
//static NSString * DZQ_Site_check =      @"/api/check";
/// 提现记录列表
static NSString * DZQ_Wallet_list =     @"/api/wallet/cash";
/// 更新用户钱包
//static NSString * DZQ_Wallet_refresh =  @"/api/wallet/user/{user_id}";
/// 查看用户钱包
static NSString * DZQ_Wallet_info =     @"/api/wallet/user/";
/// 钱包动账记录
static NSString * DZQ_Wallet_log =      @"/api/wallet/log";



////=========== 短信 =========
///// 短信发送
//static NSString * DZQ_Site_check =  @"/api/check";
///// 短信验证
//static NSString * DZQ_Site_check =  @"/api/check";


////=========== 设置 =========（站长管理员权限）
///// 配置表设置接口
//static NSString * DZQ_Site_check =  @"/api/check";
///// 前端获取指定 Tag 配置接口
//static NSString * DZQ_Site_check =  @"/api/check";



////=========== 财务 =========（站长管理员权限）
///// 获取盈利图表数据
//static NSString * DZQ_Site_check =  @"/api/check";
///// 获取资金概况
//static NSString * DZQ_Site_check =  @"/api/check";



//=========== 关注 =========
/// 创建关注关系接口[单条]
static NSString * DZQ_Follow_create =  @"/api/follow";
/// 删除关注关系接口[单条]
static NSString * DZQ_Follow_delete =  @"/api/follow";
/// 获取关注列表
static NSString * DZQ_Follow_list =  @"/api/follow";


////=========== 短消息 =========
///// 创建会话接口[单条]
static NSString * DZQ_Msg_dialog =  @"/api/dialog";
///// 创建会话接口[多条]
//static NSString * DZQ_Msg_dialogBatch =  @"/api/dialog/batch";
/// 获取会话列表
static NSString * DZQ_Msg_dialogList =  @"/api/dialog";
/// 创建会话消息接口[单条]
static NSString * DZQ_Msg_message =  @"/api/dialog/message";
/// 获取会话消息列表
static NSString * DZQ_Msg_messageList =  @"/api/dialog/message";



//=========== 话题 =========
/// 获取话题列表
static NSString * DZQ_Topic_list =  @"/api/topics";
///// 删除话题接口
//static NSString * DZQ_Site_check =  @"/api/check";
///// 删除话题接口[批量]
//static NSString * DZQ_Site_check =  @"/api/check";
/// 查询话题接口[单条]
static NSString * DZQ_Topic_one =  @"/api/topics";































