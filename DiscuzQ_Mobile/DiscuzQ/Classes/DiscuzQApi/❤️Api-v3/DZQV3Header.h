//
//  DZQV3Header.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

//=========== 01 站点 =========

/// 前端获取配置接口
static NSString * DZQ_V3_SiteForum =  @"/apiv3/forum";
///// 站点 基本信息接口
//static NSString * DZQ_V3_SiteInfo =  @"/apiv3/siteinfo";
/// 上传、删除 站点logo
//static NSString * DZQ_V3_SiteLogo =  @"/apiv3/settings/logo";
///// 检查更新
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";


//=========== 02 用户 =========

///// 用户批量删除接口
//static NSString * DZQ_V3_SiteCheck =       @"/apiv3/check";
/// 上传 头像接口
static NSString * DZQ_V3_UserUpAvatar =      @"/apiv3/users";
/// 删除 头像接口
//static NSString * DZQ_V3_UserDelavatar =    @"/apiv3/users";
/// 用户资料修改
static NSString * DZQ_V3_UserModify =        @"/apiv3/users";
///// 批量修改用户的用户组
//static NSString * DZQ_V3_UserPatchModify = @"/apiv3/users";
/// 用户资料展示
static NSString * DZQ_V3_UserProfile =       @"/apiv3/users";
/// 用户搜索接口
static NSString * DZQ_V3_UserSearch =        @"/apiv3/users";
/// 实名认证接口
static NSString * DZQ_V3_UserReal =          @"/apiv3/users/real";
/// 用户信息导出
//static NSString * DZQ_V3_UserExport =       @"/apiv3/export/users?ids";
///// 删除用户微信信息
//static NSString * DZQ_V3_SiteCheck =        @"/apiv3/users";
/// 修改支付密码 - 获取验证 token
static NSString * DZQ_V3_UserResetPayPwd =  @"/apiv3/users/pay-password/reset";
/// 拉黑某个用户
static NSString * DZQ_V3_UserDeny =         @"/apiv3/users";
/// 取消拉黑用户
static NSString * DZQ_V3_UserCancelDeny =   @"/apiv3/users";
/// 用户拉黑列表
static NSString * DZQ_V3_UserDenyList =     @"/apiv3/users";
///// 获取推荐用户的接口
//static NSString * DZQ_V3_User_recommended =     @"/apiv3/users/recommended";
///// 获取微信小程序手机号绑定接口
//static NSString * DZQ_V3_UserMiniprogramBind =     @"/apiv3/mobile/bind/miniprogram";


//=========== 03 用户认证 =========

/// 用户注册
static NSString * DZQ_V3_UserRegister =         @"/apiv3/register";
/// 用户登录
static NSString * DZQ_V3_UserLogin =            @"/apiv3/login";
///// 微信登录
//static NSString * DZQ_V3_UserWechat =         @"/oauth/wechat";
/////微信公众号登陆、注册、绑定接口
//static NSString * DZQ_V3_UserWechatUser =         @"/apiv3/oauth/wechat/user";
///// 信小程序登录、注册、绑定接口
//static NSString * DZQ_V3_SiteCheck =          @"/oauth/wechat/miniprogram";
///// 小程序码
//static NSString * DZQ_V3_SiteCheck =          @"/apiv3/oauth/wechat/miniprogram/code";
///// 微信PC登录(已弃用)
//static NSString * DZQ_V3_SiteCheck =          @"/oauth/wechat/pc";
///// 微信开放平台通过 code 参数换取 token 接口
//static NSString * DZQ_V3_SiteCheck =          @"/apiv3/oauth/wechat/pc/user";
///// PC微信扫码登录微信服务器返回信息接口
//static NSString * DZQ_V3_SiteCheck =          @"/apiv3/oauth/wechat/web/user/event";
///// PC微信扫码登录生成二维码接口
//static NSString * DZQ_V3_SiteCheck =          @"/apiv3/oauth/wechat/web/user";
///// PC微信扫码登录查询用户扫码状态接口
//static NSString * DZQ_V3_SiteCheck =          @"/apiv3/oauth/wechat/web/user/serach";
///// 企业微信登录
//static NSString * DZQ_V3_User_Wxqy =           @"/apiv3/oauth/wechat/qy";
///// 企业微信通过 code 参数换取 token 接口
//static NSString * DZQ_V3_User_WxqyUser =      @"/apiv3/oauth/wechat/qy/user";
///// QQ登录
//static NSString * DZQ_V3_User_QQ =             @"/apiv3/oauth/qq";
///// QQ登录参数换取token接口
//static NSString * DZQ_V3_User_QQUser =        @"/apiv3/oauth/qq/user";
/// 用户刷新 token 接口
static NSString * DZQ_V3_UserRefreshToken =     @"/apiv3/refresh-token";
///// UCenter用户刷新 token 接口
//static NSString * DZQ_V3_User_UCLogin =          @"/apiv3/uc/login";


//=========== 04 用户组 =========

///// 添加 用户组
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
///// 上传用户组图标
//static NSString * DZQ_V3_Group_addIcon =     @"/apiv3/groups";
///// 用户组单条删除接口
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
///// 用户组批量删除接口
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
///// 用户组单条修改
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
///// 用户组多条修改
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
///// 查询用户组接口[单条]
//static NSString * DZQ_V3_GroupList =        @"/apiv3/groups";
/// 获取所有用户组
static NSString * DZQ_V3_GroupList =        @"api/groups";
/// 用户付费用户组列表
//static NSString * DZQ_V3_GroupList =        @"groups/paid";



//=========== 05 权限 =========
///// 修改用户组权限接口
//static NSString * DZQ_V3User_GroupsPermission =  @"/apiv3/permission";



//=========== 06 通知 =========
/// 查询通知列表
static NSString * DZQ_V3_NotiList =  @"/apiv3/notification";
/// 删除通知[单个/批量]
static NSString * DZQ_V3_NotiDelete =  @"/apiv3/notification";
///// 查询、修改 系统消息模版列表
//static NSString * DZQ_V3_Noti_tpl =  @"/apiv3/notification/tpl";




// //=========== 07 分类 =========
// /// 创建分类接口[单条]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
// /// 创建分类接口[多条]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
// /// 删除分类接口[单个]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
// /// 删除主题接口[批量]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
// /// 修改分类接口[单条]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
// /// 修改分类接口[多条]
//static NSString * DZQ_V3_CateList =  @"/apiv3/check";
/// 查询分类接口[列表]
static NSString * DZQ_V3_CateList =  @"/apiv3/categories";



//=========== 08 主题 =========
///// 创建主题接口
static NSString * DZQ_V3_ThreadCreate =  @"/apiv3/thread.create";
///// 创建主题视频接口  （用作前端上传后回调。供后续视频清理使用）
static NSString * DZQ_V3_ThreadVideo =  @"/apiv3/thread/video";
///// 删除主题接口[单个]
static NSString * DZQ_V3_ThreadDelete =  @"/apiv3/threads";
///// 删除主题接口[批量]
//static NSString * DZQ_V3_ThreadCheck =  @"/apiv3/check";
///// 修改主题接口[单条]
static NSString * DZQ_V3_ThreadReset =  @"/apiv3/threads";
///// 修改主题接口[批量]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
/// 查询主题接口[单条]
static NSString * DZQ_V3_ThreadOne =     @"/apiv3/threads";
/// 查询主题接口[列表]
static NSString * DZQ_V3_ThreadList =    @"/apiv3/threads";
/// 查询我收藏的主题接口[列表]
static NSString * DZQ_V3_ThreadFavorites =  @"/apiv3/favorites";
/// 分享主题时获取主题信息接口[单条]
static NSString * DZQ_V3_ThreadShare =  @"/apiv3/threads/share";
/// 查询用户点赞的主题列表接口[列表]
static NSString * DZQ_V3_ThreadLikes =  @"/apiv3/threads/likes";
/// 创建云点播前端上传签名
static NSString * DZQ_V3_ThreadSignature =  @"/apiv3/signature";
///// 获取相关主题的接口
//static NSString * DZQ_V3_Thread_relate =  @"/apiv3/threads/relate";





//=========== 09 回复 =========
///// 删除回复接口[批量]
//static NSString * DZQ_V3_PostCheck =  @"/apiv3/posts/batch";
///// 修改回复接口[批量]
//static NSString * DZQ_V3_PostCheck =  @"/apiv3/posts/batch";
///// 创建回复接口
static NSString * DZQ_V3_PostCreate =  @"/apiv3/posts";
/// 删除回复接口[单个]
static NSString * DZQ_V3_PostDelete =  @"/apiv3/posts";
/// 查询回复接口[列表]
static NSString * DZQ_V3_PostList =  @"/apiv3/posts";
///// 修改回复接口[单条]
static NSString * DZQ_V3_PostReset =  @"/apiv3/posts";
/// 查询我点赞的帖子(回复)接口[列表]
static NSString * DZQ_V3_PostLike =  @"/apiv3/likes";

//=========== 10 附件 =========
/// 上传附件接口
static NSString * DZQ_V3_AttachUpload =  @"/apiv3/attachments";
/// 删除附件接口[单个]
static NSString * DZQ_V3_AttachDelete =  @"/apiv3/attachments";





//=========== 11 敏感词 =========（站长管理员权限）
///// 创建敏感词接口[单条]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 创建敏感词接口[批量]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 删除敏感词接口[单个/批量]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 修改敏感词接口
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 查询敏感词接口[单条]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 查询敏感词接口[列表]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 导出敏感词接口
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";



//=========== 12 举报 =========
/// 创建举报数据
static NSString * DZQ_V3_ReportsCreate =  @"/apiv3/reports";
///// 举报列表数据
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 批量删除举报
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 批量修改举报
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";



//=========== 13 表情 =========
/// 表情[列表]
static NSString * DZQ_V3_EmojiList =  @"/apiv3/emoji";
///// 表情自动加载更新（下载所有表情包）
//static NSString * DZQ_V3_Emoji_load =  @"/apiv3/emojiLoad";



////=========== 14 邀请 =========
///// 管理员创建一码一用邀请码
//static NSString * DZQ_V3_InviteAdmin =  @"/apiv3/invite";
/// 普通用户创建邀请码
static NSString * DZQ_V3_InviteUser =  @"/apiv3/userInviteCode";
///// 删除邀请码[单个]---删除管理员一码一用邀请码[单个]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 管理员邀请码[列表]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 被邀请用户列表
//static NSString * DZQ_V3_InviteUserList =  @"//apiv3/invite/users;




////=========== 15 订单 =========
///// 支付订单
//static NSString * DZQ_V3_OrderPay =  @"//apiv3/trade/pay/order/{order_sn}";
///// 创建订单
//static NSString * DZQ_V3_OrderCreate =  @"/apiv3/orders";
/// 订单列表
static NSString * DZQ_V3_OrderList =  @"/apiv3/orders";
/// 查询订单（单条）
static NSString * DZQ_V3_OrderOne =  @"/apiv3/orders";



////=========== 16 钱包 =========
///// 提现申请
static NSString * DZQ_V3_WalletWithdraw =      @"/apiv3/wallet/cash?include={user,userWallet}";
///// 提现审核
//static NSString * DZQ_V3_SiteCheck =      @"/apiv3/check";
/// 提现记录列表
static NSString * DZQ_V3_WalletList =     @"/apiv3/wallet/cash";
/// 更新用户钱包
//static NSString * DZQ_V3_Wallet_refresh =  @"/apiv3/wallet/user/{user_id}";
/// 查看用户钱包
static NSString * DZQ_V3_WalletInfo =     @"/apiv3/wallet/user/";
/// 钱包动账记录
static NSString * DZQ_V3_WalletLog =      @"/apiv3/wallet/log";



////=========== 17 短信 =========
///// 短信发送
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 短信验证
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";


////=========== 18 设置 =========（站长管理员权限）
///// 配置表设置接口
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 前端获取指定 Tag 配置接口
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";



////=========== 19 财务 =========（站长管理员权限）
///// 获取盈利图表数据
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 获取资金概况
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";



//=========== 20 关注 =========
/// 创建关注关系接口[单条]
static NSString * DZQ_V3_FollowCreate =  @"/apiv3/follow";
/// 删除关注关系接口[单条]
static NSString * DZQ_V3_FollowDelete =  @"/apiv3/follow";
/// 获取关注列表
static NSString * DZQ_V3_FollowList =  @"/apiv3/follow";


////=========== 21 短消息 =========
///// 创建会话接口[单条]
static NSString * DZQ_V3_MsgDialog =  @"/apiv3/dialog";
///// 创建会话接口[多条]
//static NSString * DZQ_V3MsgDialogBatch =  @"/apiv3/dialog/batch";
/// 获取会话列表
static NSString * DZQ_V3_MsgDialogList =  @"/apiv3/dialog";
/// 创建会话消息接口[单条]
static NSString * DZQ_V3_MsgMessage =  @"/apiv3/dialog/message";
/// 获取会话消息列表
static NSString * DZQ_V3_MsgMessageList =  @"/apiv3/dialog/message";
///// 删除私信会话[单个]
//static NSString * DZQ_V3MsgMessageList =  @"/apiv3/dialog";



//=========== 22 话题 =========
/// 获取话题列表
static NSString * DZQ_V3_TopicList =  @"/apiv3/topics";
///// 删除话题接口
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
///// 删除话题接口[批量]
//static NSString * DZQ_V3_SiteCheck =  @"/apiv3/check";
/// 查询话题接口[单条]
static NSString * DZQ_V3_TopicOne =  @"/apiv3/topics";
































