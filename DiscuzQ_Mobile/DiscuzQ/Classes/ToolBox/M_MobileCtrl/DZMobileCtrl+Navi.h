//
//  DZMobileCtrl+Navi.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

@class DZNotiItem;
@class DZBaseAuthModel;
@interface DZMobileCtrl (Navi)

- (void)PopToPrevieousController:(BOOL)animated;

- (void)PushToController:(UIViewController *)CtrlVC;

- (void)PresentViewController:(UIViewController *)CtrlVC;

- (void)PushToOtherUserController:(NSString *)userId;

/// 帖子详情页
- (void)PushToThreadDetailController:(NSString *)tid;

/// 分类板块 帖子列表
- (void)PushToForumCateController:(NSString *)cate_id;


- (void)PushToWebViewController:(NSString *)link;

// 跳转登录
- (void)PresentLoginController;
- (void)PushToSearchController;
- (void)PresentRegisterController;

// 主题发布页
- (void)PushToPostTabViewController;

// 跳转 我的好友（我的关注 我的粉丝）
-(void)PushToMyFriendListControlle:(NSString *)user_id;
// 跳转 我的钱包
-(void)PushToMyWalletViewController;

// 跳转 账号详情页
-(void)PushToMyProfileViewController;

/// 跳转 我的收藏
-(void)PushToMyCollectionController;

// 跳转 草稿箱
-(void)PushToMyDraftListViewController;

/// 跳转 消息详情页
-(void)PushToMsgDetailListController:(DZNotiItem *)item;


/// 跳转 我的帖子列表(帖子+回复)
-(void)PushToMyThreadListController;

/// 跳转 用户设置
-(void)PushToSettingViewController;


// 跳转 他的话题
-(void)PushToUserThreadController:(NSString *)Uid;

/// 账号绑定
- (void)PushToAccountBindController;

/// 发送消息
-(void)PushToMsgSendController:(NSString *)Uid;

/// 消息聊天界面
-(void)PushToMsgChatController:(NSString *)touid name:(NSString *)userName;

/// 重置密码
- (void)PushToResetPwdController;

/// appstore 评价APP
-(void)PushToAppStoreWebview;

// 跳转 站点详情
-(void)PushToSiteInfoViewController;

/// 域名选择
-(void)PushToDomainSettingController;

/// app 介绍
-(void)PushToAppAboutViewController;

/// 用户 协议
-(void)PushToUserTermController;

/// 分享 app
- (void)shareMyMobileAPPWithView:(UIView *)view;

/// 账号绑定状态
-(void)PushToJudgeBindController;

/// 消息中心
- (void)PushToMessageCenterController:(DZQUnReadModel *)UnReadModel;


@end


