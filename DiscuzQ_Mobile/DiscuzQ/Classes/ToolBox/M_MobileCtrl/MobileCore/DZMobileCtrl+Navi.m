//
//  DZMobileCtrl+Navi.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Navi.h"
#import "DZOtherUserController.h"
#import "DZThreadCateListController.h"
#import "DZBaseUrlController.h"
#import "DZLoginController.h"
#import "DZThreadHelper.h"
#import "DZSearchViewController.h"
#import "DZMyDraftListController.h"
#import "DZFavoriteListController.h"
#import "DZMyFriendListController.h"
#import "DZSettingController.h"
#import "DZMyWalletViewController.h"
#import "DZMyProfileViewController.h"
#import "DZQChatViewController.h"

#import "DZResetPwdController.h"
#import "DZDomainListController.h"
#import "DZAboutController.h"
#import "DZTopicDetailController.h"
#import "DZTopicListViewController.h"
#import "DZSiteInfoViewController.h"
#import "DZUsertermsController.h"
#import "DZRegisterController.h"
#import "DZRootPublishController.h"
#import "DZPostPublishController.h"
#import "DZMyThreadListController.h"
#import "DZNotiDetailListController.h"
#import "DZThreadDetailController.h"

@implementation DZMobileCtrl (Navi)

- (void)PopToPreviousController:(BOOL)animated{
    [self.mainNavi popViewControllerAnimated:YES];
    
}
- (void)PushToController:(UIViewController *)CtrlVC{
    if (CtrlVC) {
        [self.mainNavi pushViewController:CtrlVC animated:YES];
    }
}


- (void)PresentViewController:(UIViewController *)CtrlVC{
    if (CtrlVC) {
        CtrlVC.modalPresentationStyle = UIModalPresentationFullScreen;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mainNavi.topViewController showViewController:CtrlVC sender:nil];
        });
    }
}

// 个人详情页
- (void)PushToOtherUserController:(NSString *)userId{
    DZOtherUserController * ovc = [[DZOtherUserController alloc] initWithUser:userId];
    [self.mainNavi pushViewController:ovc animated:YES];
}

// 跳转 我的好友（我的关注 我的粉丝）
-(void)PushToUserFriendListCtrl:(NSString *)user_id isFans:(BOOL)isFans{
    
    NSInteger index = isFans ? 1 : 0;
    DZMyFriendListController *mfvc = [[DZMyFriendListController alloc] initWithUser:user_id index:index];
    [self.mainNavi pushViewController:mfvc animated:YES];
}


/// 帖子详情页
- (DZThreadDetailController *)PushToThreadDetailController:(NSString *)tid {
    DZThreadDetailController *detailVC = [[DZThreadDetailController alloc] initWithThread:tid];
    [self.mainNavi pushViewController:detailVC animated:YES];
    return detailVC;
}

/// 分类板块 帖子列表
- (void)PushToForumCateController:(DZThreadCateM *)dataCate {
    DZThreadCateListController *CateVC = [[DZThreadCateListController alloc] init];
    CateVC.dataCate = dataCate;
    [self.mainNavi pushViewController:CateVC animated:YES];
}

// 话题详情页
- (void)PushToTopicDetailController:(NSString *)topicId {
    DZTopicDetailController *topicVC = [[DZTopicDetailController alloc] init];
    topicVC.topicId = topicId;
    [self.mainNavi pushViewController:topicVC animated:YES];
}

// 话题列表页
- (void)PushToTopicListViewController {
    DZTopicListViewController *tListVC = [[DZTopicListViewController alloc] init];
    [self.mainNavi pushViewController:tListVC animated:YES];
}


- (void)PushToWebViewController:(NSString *)link {
    link = checkNull(link);
    if (!link.length) {
        return;
    }
    DZBaseUrlController *urlCtrl = [[DZBaseUrlController alloc] init];
    urlCtrl.urlString = link;
    [self.mainNavi pushViewController:urlCtrl animated:YES];
}

//拨打电话
- (void)PushToPhoneViewWithNumber:(NSString *)phoneNum {
    phoneNum = checkNull(phoneNum);
    if (!phoneNum.length) {
        return;
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:checkTwoStr(@"tel:", phoneNum)] options:nil completionHandler:nil];
}

- (void)PresentLoginController{
    DZLoginController *loginVC = [[DZLoginController alloc] init];
    loginVC.isTabbarSelected = NO;
    loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.mainNavi.topViewController showViewController:loginVC sender:nil];
}

- (void)PresentRegisterController{
    DZRegisterController *registVC = [[DZRegisterController alloc] init];
    registVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.mainNavi.topViewController showViewController:registVC sender:nil];
}

// 主题发布页
- (void)PushToThreadPublishController{

    DZRootPublishController *PostTab = [DZRootPublishController initWithLogin];
    [self.mainNavi pushViewController:PostTab animated:YES];
    
}

// 评论发布页
- (void)PresentPostPublishController{

    DZPostPublishController *PostTab = [DZPostPublishController initWithLogin];
    [self.mainNavi.topViewController presentViewController:PostTab animated:YES completion:^{
            
    }];
    
}

- (void)PushToSearchController{
    
    DZSearchViewController *searchVC = [[DZSearchViewController alloc] init];
    [self.mainNavi pushViewController:searchVC animated:YES];
}

// 跳转 我的钱包
-(void)PushToMyWalletViewController{
    DZMyWalletViewController *walletVC = [[DZMyWalletViewController alloc] init];
    [self.mainNavi pushViewController:walletVC animated:YES];
}

// 跳转 账号详情页
-(void)PushToMyProfileViewController{
    DZMyProfileViewController *profileVC = [[DZMyProfileViewController alloc] init];
    [self.mainNavi pushViewController:profileVC animated:YES];
}

// 跳转 我的收藏
-(void)PushToMyCollectionController{
    
    NSString *user_id = [DZMobileCtrl sharedCtrl].User.user_id;
    DZFavoriteListController *mfvc = [[DZFavoriteListController alloc] initWithUser:user_id index:0];
    [self.mainNavi pushViewController:mfvc animated:YES];
}

// 跳转 草稿箱
-(void)PushToMyDraftListViewController{
    DZMyDraftListController *mfvc = [[DZMyDraftListController alloc] init];
    [self.mainNavi pushViewController:mfvc animated:YES];
}


/// 跳转 消息详情页
-(void)PushToMsgDetailListController:(DZNotiItem *)item{

    DZNotiDetailListController *detailVC = [[DZNotiDetailListController alloc] initWithItem:item];
    [self.mainNavi pushViewController:detailVC animated:YES];
    
}

// 跳转 站点详情
-(void)PushToSiteInfoViewController{
    DZSiteInfoViewController *siteVC = [[DZSiteInfoViewController alloc] init];
    [self.mainNavi pushViewController:siteVC animated:YES];
}



/// 跳转 我的帖子列表
-(void)PushToMyThreadListController{
    NSString *user_id = [DZMobileCtrl sharedCtrl].User.user_id;
    DZMyThreadListController *trVc = [[DZMyThreadListController alloc] initWithUserid:user_id];
    [self.mainNavi pushViewController:trVc animated:YES];
}

// 跳转 用户设置
-(void)PushToSettingViewController{
    DZSettingController * setVC = [[DZSettingController alloc] init];
    [self.mainNavi pushViewController:setVC animated:YES];
}


/// 账号绑定
- (void)PushToAccountBindController {
    
}

// 消息聊天界面
-(void)PushToMsgChatController:(DZQDataDialog *)dataDialog{
    if (![DZMobileCtrl sharedCtrl].isLogin) {
        return;
    }
    DZQChatViewController *chatVC = [[DZQChatViewController alloc] initWithDialog:dataDialog];
    [self.mainNavi pushViewController:chatVC animated:YES];
}

// 重置密码
- (void)PushToResetPwdController {
    DZResetPwdController *restVc = [[DZResetPwdController alloc] init];
    [self.mainNavi pushViewController:restVc animated:YES];
}

/// 域名选择
-(void)PushToDomainSettingController {
    DZDomainListController *domainVC = [[DZDomainListController alloc] init];
    [self.mainNavi pushViewController:domainVC animated:YES];
}

/// app 介绍
-(void)PushToAppAboutViewController {
    DZAboutController *abVC = [[DZAboutController alloc] init];
    [self.mainNavi pushViewController:abVC animated:YES];
}

/// 用户 协议
-(void)PushToUserTermController {
    DZUsertermsController *termVC = [[DZUsertermsController alloc] init];
    [self.mainNavi showViewController:termVC sender:nil];
}

/// appstore 评价APP
-(void)PushToAppStoreWebview {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:DZ_StorePath] options:@{} completionHandler:nil];
}

/// 账号绑定状态
-(void)PushToJudgeBindController {
    
}

/// 主题分享
-(void)shareThreadActionWithModel:(DZQDataThread *)threadModel {
    
    [DZShareCenter shareActionWithThreadModel:threadModel];
}


/// 删除 主题
-(void)deleteThreadActionWithModel:(DZQDataThread *)threadModel {
    
    [DZThreadHelper thread_deleteCellAction:threadModel.inner_id block:^(BOOL boolState) {
        NSLog(@"");
    }];
}

/// 举报某条主题
-(void)complainActionWithThreadId:(NSString *)threadId {
    
    [DZThreadHelper thread_reportCellAction:threadId block:^(BOOL boolState) {
        KSLog(@"我要举报你了-----举报结束");
    }];
}

/// 举报某 用户
-(void)complainUserActionWithUserId:(NSString *)userId {
    
    KSLog(@"我要举报 某个用户-----%@",userId);
}

/// 分享 app
- (void)shareMyMobileAPPWithView:(UIView *)view {
    
//    [[DZSDKCenter Shared] shareText:@"Discuz客户端产品，提供方便简洁的发帖与阅读体验" andImages:@[[DZDevice getIconName]] andUrlstr:DZ_StorePath andTitle:DZ_APP_Name andView:view andHUD:nil];
}


@end







