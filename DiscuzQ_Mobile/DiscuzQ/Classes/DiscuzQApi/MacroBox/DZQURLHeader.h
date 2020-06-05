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
/// 前端获取配置
static NSString * DZQ_Site_forum =  @"/api/forum";
/// 站点 基本信息
//static NSString * DZQ_Site_siteInfo =  @"/siteinfo";
/// 上传、删除 站点logo
static NSString * DZQ_Site_setlogo =  @"/api/settings/logo";
/// 检查更新
//static NSString * DZQ_Site_check =  @"/api/check";
/// 站点默认Logo
//static NSString * DZQ_Site_logo =   @"/static/images/logo.png";


//=========== 用户 =========
/// 用户批量删除接口
//static NSString * DZQ_Site_check =  @"/api/check";
///// 上传头像接口
//static NSString * DZQ_Site_check =  @"/api/check";
///// 删除用户头像
//static NSString * DZQ_Site_check =  @"/api/check";
///// 用户资料修改
//static NSString * DZQ_Site_check =  @"/api/check";
///// 批量修改用户的用户组
//static NSString * DZQ_Site_check =  @"/api/check";
/// 用户资料展示
static NSString * DZQ_User_profile =  @"/api/users";
///// 用户搜索接口
//static NSString * DZQ_Site_check =  @"/api/check";
/// 实名认证接口
//static NSString * DZQ_User_real =  @"/api/users/real";
/// 用户信息导出
//static NSString * DZQ_User_export =  @"/api/export/users?ids";
///// 删除用户微信信息
//static NSString * DZQ_Site_check =  @"/api/check";
/// 修改支付密码 - 获取验证 token
//static NSString * DZQ_User_resetPayPwd =  @"/api/users/pay-password/reset";
///// 拉黑某个用户
//static NSString * DZQ_Site_check =  @"/api/check";
///// 取消拉黑用户
//static NSString * DZQ_Site_check =  @"/api/check";
///// 用户拉黑列表
//static NSString * DZQ_Site_check =  @"/api/check";


//=========== 用户认证 =========
/// 用户注册
static NSString * DZQ_User_register =  @"/api/register";
/// 用户登录
static NSString * DZQ_User_login =  @"/api/login";
/// 微信登录
//static NSString * DZQ_User_wechat =  @"/oauth/wechat";
/// 微信登录（PC版本）
//static NSString * DZQ_User_WX_PCLogin =  @"/oauth/wechat/pc";
/// 用户刷新 token 接口
static NSString * DZQ_User_refreshToken =  @"/api/refresh-token";


//=========== 用户组 =========
/// 添加 用户组
//static NSString * DZQ_User_groups =  @"/groups";
/// 用户组单条删除接口
//static NSString * DZQ_User_groups =  @"/api/groups";
/// 用户组批量删除接口
//static NSString * DZQ_User_groups =  @"/api/groups";
/// 用户组单条修改
//static NSString * DZQ_User_groups =  @"/api/groups";
/// 用户组多条修改
//static NSString * DZQ_User_groups =  @"/api/groups";
/// 查询用户组接口[单条]
//static NSString * DZQ_User_groups =  @"/api/groups";
/// 获取所有用户组
//static NSString * DZQ_User_groups =  @"/groups";




//=========== 权限 =========
/// 修改用户组权限接口
//static NSString * DZQ_User_GroupsPermission =  @"/api/permission";




//=========== 通知 =========
/// 查询、删除通知[单个/批量]
static NSString * DZQ_Noti_list =  @"/api/notification";
/// 查询、修改 系统消息模版列表
//static NSString * DZQ_Noti_tpl =  @"/api/notification/tpl";



/*
 
//=========== 分类 =========
/// 创建分类接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建分类接口[多条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 删除分类接口[单个]
static NSString * DZQ_Site_check =  @"/api/check";
/// 删除主题接口[批量]
static NSString * DZQ_Site_check =  @"/api/check";
/// 修改分类接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 修改分类接口[多条]
static NSString * DZQ_Site_check =  @"/api/check";
 */
/// 查询分类接口[列表]
static NSString * DZQ_Cate_list =  @"/api/categories";


//=========== 主题 =========
///// 创建主题接口
//static NSString * DZQ_Topic_check =  @"/api/check";
///// 创建主题视频接口
//static NSString * DZQ_Topic_check =  @"/api/check";
///// 删除主题接口[单个]
//static NSString * DZQ_Topic_check =  @"/api/check";
///// 删除主题接口[批量]
//static NSString * DZQ_Topic_check =  @"/api/check";
///// 修改主题接口[单条]
//static NSString * DZQ_Topic_check =  @"/api/check";
///// 修改主题接口[批量]
//static NSString * DZQ_Site_check =  @"/api/check";
/// 查询主题接口[单条]
static NSString * DZQ_Topic_one =     @"/api/threads";
/// 查询主题接口[列表]
static NSString * DZQ_Topic_list =    @"/api/threads";
///// 查询我收藏的主题接口[列表]
//static NSString * DZQ_Site_check =  @"/api/check";
///// 分享主题时获取主题信息接口[单条]
//static NSString * DZQ_Site_check =  @"/api/check";

/*
//=========== 回复 =========
/// 删除回复接口[批量]
static NSString * DZQ_Comment_check =  @"/api/check";
/// 修改回复接口[批量]
static NSString * DZQ_Comment_check =  @"/api/check";
/// 创建回复接口
static NSString * DZQ_Comment_check =  @"/api/check";
/// 删除回复接口[单个]
static NSString * DZQ_Comment_check =  @"/api/check";
/// 查询回复接口[列表]
static NSString * DZQ_Comment_check =  @"/api/check";
/// 修改回复接口[单条]
static NSString * DZQ_Comment_check =  @"/api/check";
/// 查询我点赞的帖子接口[列表]
static NSString * DZQ_Comment_check =  @"/api/check";



//=========== 附件 =========
///// 上传附件接口
//static NSString * DZQ_Attach_check =  @"/api/check";
///// 删除附件接口[单个]
//static NSString * DZQ_Attach_check =  @"/api/check";




//=========== 话题 =========
///// 获取话题列表
//static NSString * DZQ_Site_check =  @"/api/check";



//=========== 敏感词 =========
/// 创建敏感词接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建敏感词接口[批量]
static NSString * DZQ_Site_check =  @"/api/check";
/// 删除敏感词接口[单个/批量]
static NSString * DZQ_Site_check =  @"/api/check";
/// 修改敏感词接口
static NSString * DZQ_Site_check =  @"/api/check";
/// 查询敏感词接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 查询敏感词接口[列表]
static NSString * DZQ_Site_check =  @"/api/check";
/// 导出敏感词接口
static NSString * DZQ_Site_check =  @"/api/check";



//=========== 举报 =========
/// 创建举报数据
static NSString * DZQ_Site_check =  @"/api/check";
/// 举报列表数据
static NSString * DZQ_Site_check =  @"/api/check";
/// 批量删除举报
static NSString * DZQ_Site_check =  @"/api/check";
/// 批量修改举报
static NSString * DZQ_Site_check =  @"/api/check";



//=========== 表情 =========
/// 表情[列表]
static NSString * DZQ_Site_check =  @"/api/check";
/// 表情自动加载更新
static NSString * DZQ_Site_check =  @"/api/check";



//=========== 邀请 =========
/// 创建邀请码
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建邀请码
static NSString * DZQ_Site_check =  @"/api/check";
/// 删除邀请码[单个]
static NSString * DZQ_Site_check =  @"/api/check";
/// 管理员邀请码[列表]
static NSString * DZQ_Site_check =  @"/api/check";


//=========== 订单 =========
/// 支付订单
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建订单
static NSString * DZQ_Site_check =  @"/api/check";
/// 订单列表
static NSString * DZQ_Site_check =  @"/api/check";
/// 查询订单（单条）
static NSString * DZQ_Site_check =  @"/api/check";


//=========== 钱包 =========
/// 提现申请
static NSString * DZQ_Site_check =  @"/api/check";
/// 提现审核
static NSString * DZQ_Site_check =  @"/api/check";
/// 提现记录列表
static NSString * DZQ_Site_check =  @"/api/check";
/// 更新用户钱包
static NSString * DZQ_Site_check =  @"/api/check";
/// 查看用户钱包
static NSString * DZQ_Site_check =  @"/api/check";
/// 钱包动账记录
static NSString * DZQ_Site_check =  @"/api/check";


//=========== 短信 =========
/// 短信发送
static NSString * DZQ_Site_check =  @"/api/check";
/// 短信验证
static NSString * DZQ_Site_check =  @"/api/check";


//=========== 设置 =========
/// 配置表设置接口
static NSString * DZQ_Site_check =  @"/api/check";
/// 前端获取指定 Tag 配置接口
static NSString * DZQ_Site_check =  @"/api/check";



//=========== 财务 =========
/// 获取盈利图表数据
static NSString * DZQ_Site_check =  @"/api/check";
/// 获取资金概况
static NSString * DZQ_Site_check =  @"/api/check";



//=========== 关注 =========
/// 创建关注关系接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 删除关注关系接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 获取关注列表
static NSString * DZQ_Site_check =  @"/api/check";


//=========== 短消息 =========
/// 创建会话接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建会话接口[多条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 获取会话列表
static NSString * DZQ_Site_check =  @"/api/check";
/// 创建会话消息接口[单条]
static NSString * DZQ_Site_check =  @"/api/check";
/// 获取会话消息列表
static NSString * DZQ_Site_check =  @"/api/check";

*/






