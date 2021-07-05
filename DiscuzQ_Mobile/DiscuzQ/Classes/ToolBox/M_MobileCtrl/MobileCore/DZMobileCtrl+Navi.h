//
//  DZMobileCtrl+Navi.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

@class DZNotiItem;
@class DZShareModel;
@class DZThreadDetailController;

@interface DZMobileCtrl (Navi)

- (void)PopToPreviousController:(BOOL)animated;

- (void)PushToController:(UIViewController *)CtrlVC;

- (void)PresentViewController:(UIViewController *)CtrlVC;

// 个人详情页
- (void)PushToOtherUserController:(NSString *)userId;

// 跳转 我的好友（我的关注 我的粉丝）
-(void)PushToUserFriendListCtrl:(NSString *)user_id isFans:(BOOL)isFans;

/// 帖子详情页
- (DZThreadDetailController *)PushToThreadDetailController:(NSString *)tid;

/// 分类板块 帖子列表
- (void)PushToForumCateController:(DZThreadCateM *)dataCate;

// 话题列表页
- (void)PushToTopicListViewController;
// 话题详情页
- (void)PushToTopicDetailController:(NSString *)topicId;

- (void)PushToWebViewController:(NSString *)link;

//拨打电话
- (void)PushToPhoneViewWithNumber:(NSString *)phoneNum;

// 跳转登录
- (void)PresentLoginController;
- (void)PushToSearchController;
- (void)PresentRegisterController;

// 主题发布页
- (void)PushToThreadPublishController;

// 评论发布页
- (void)PresentPostPublishController;

// 跳转 我的钱包
-(void)PushToMyWalletViewController;

// 跳转 账号详情页
-(void)PushToMyProfileViewController;

/// 跳转 我的收藏
-(void)PushToMyCollectionController;

// 跳转 草稿箱
-(void)PushToMyDraftListViewController;

/// 跳转 我的帖子列表(帖子+回复)
-(void)PushToMyThreadListController;

/// 跳转 消息详情页
-(void)PushToMsgDetailListController:(DZNotiItem *)item;


/// 跳转 用户设置
-(void)PushToSettingViewController;

/// 账号绑定
- (void)PushToAccountBindController;

/// 消息聊天界面
-(void)PushToMsgChatController:(DZQDataDialog *)dataDialog;

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

/// 举报某条主题
-(void)complainActionWithThreadId:(NSString *)threadId;

/// 举报某 用户
-(void)complainUserActionWithUserId:(NSString *)userId;

/// 主题分享
-(void)shareThreadActionWithModel:(DZQDataThread *)threadModel;

/// 删除 主题
-(void)deleteThreadActionWithModel:(DZQDataThread *)threadModel;






@end


