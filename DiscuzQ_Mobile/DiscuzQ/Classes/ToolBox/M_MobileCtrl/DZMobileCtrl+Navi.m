//
//  DZMobileCtrl+Navi.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Navi.h"
#import "DZOtherUserController.h"
#import "DZThreadCateListController.h"
#import "DZBaseUrlController.h"
#import "DZLoginController.h"
#import "DZSearchController.h"
#import "DZMyDraftListController.h"
#import "DZMessageViewController.h"
#import "DZFavoriteListController.h"
#import "DZMyFriendListController.h"
#import "DZSettingController.h"
#import "DZMyWalletViewController.h"
#import "DZMyProfileViewController.h"
#import "DZMsgChatDetailController.h"

#import "DZResetPwdController.h"
#import "DZSendMsgViewController.h"
#import "DZDomainListController.h"
#import "DZAboutController.h"
#import "DZSiteInfoViewController.h"
#import "DZThreadDetailController.h"
#import "DZUsertermsController.h"
#import "DZRegisterController.h"
#import "DZRootPostTabController.h"
#import "DZMyThreadListController.h"
#import "DZMsgDetailListController.h"

@implementation DZMobileCtrl (Navi)

- (void)PopToPrevieousController:(BOOL)animated{
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

- (void)PushToOtherUserController:(NSString *)userId{
    NSString *userIdStr = checkNull(userId);
    DZOtherUserController * ovc = [[DZOtherUserController alloc] initWithAuthor:userIdStr];
    [self.mainNavi pushViewController:ovc animated:YES];
}

/// 帖子详情页
- (void)PushToThreadDetailController:(NSString *)tid {
    DZThreadDetailController *detailVC = [[DZThreadDetailController alloc] initWithThread:tid];
    [self.mainNavi pushViewController:detailVC animated:YES];
}

/// 分类板块 帖子列表
- (void)PushToForumCateController:(NSString *)cate_id {
    DZThreadCateListController *lianMixVc = [[DZThreadCateListController alloc] init];
    lianMixVc.forumFid = cate_id;
    [self.mainNavi pushViewController:lianMixVc animated:YES];
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
- (void)PushToPostTabViewController{

    NSArray *tabArray = [DZPostTool localPostTab];
    DZRootPostTabController *PostTab = [[DZRootPostTabController alloc] initWithTabArr:tabArray];
    [self.mainNavi pushViewController:PostTab animated:YES];
    
}

- (void)PushToSearchController{
    
    DZSearchController *searchVC = [[DZSearchController alloc] init];
    [self.mainNavi pushViewController:searchVC animated:YES];
}


// 跳转 我的好友（我的关注 我的粉丝）
-(void)PushToMyFriendListControlle:(NSString *)user_id{
    DZMyFriendListController *mfvc = [[DZMyFriendListController alloc] initWithUserid:user_id];
    [self.mainNavi pushViewController:mfvc animated:YES];
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
    DZFavoriteListController *mfvc = [[DZFavoriteListController alloc] init];
    [self.mainNavi pushViewController:mfvc animated:YES];
}

// 跳转 草稿箱
-(void)PushToMyDraftListViewController{
    DZMyDraftListController *mfvc = [[DZMyDraftListController alloc] init];
    [self.mainNavi pushViewController:mfvc animated:YES];
}


/// 跳转 消息详情页
-(void)PushToMsgDetailListController:(DZNotiItem *)item{

    DZMsgDetailListController *detailVC = [[DZMsgDetailListController alloc] initWithItem:item];
    [self.mainNavi pushViewController:detailVC animated:YES];
    
}

// 跳转 站点详情
-(void)PushToSiteInfoViewController{
    DZSiteInfoViewController *siteVC = [[DZSiteInfoViewController alloc] init];
    [self.mainNavi pushViewController:siteVC animated:YES];
}



/// 跳转 我的帖子列表
-(void)PushToMyThreadListController{
    DZMyThreadListController *trVc = [[DZMyThreadListController alloc] initWithUserid:nil];
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


// 发送消息
-(void)PushToMsgSendController:(NSString *)Uid{
    DZSendMsgViewController *sendVC = [[DZSendMsgViewController alloc] init];
    sendVC.uid = checkNull(Uid);
    [self.mainNavi pushViewController:sendVC animated:YES];
}


// 消息聊天界面
-(void)PushToMsgChatController:(NSString *)touid name:(NSString *)userName{
    DZMsgChatDetailController *mvc = [[DZMsgChatDetailController alloc] init];
    mvc.touid = touid;
    mvc.nametitle = userName;
    mvc.username = userName;
    
    [self.mainNavi pushViewController:mvc animated:YES];
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

/// 分享 app
- (void)shareMyMobileAPPWithView:(UIView *)view {
    
    [[DZSDKShareCenter shareInstance] shareText:@"Discuz客户端产品，提供方便简洁的发帖与阅读体验" andImages:@[[DZDevice getIconName]] andUrlstr:DZ_StorePath andTitle:DZ_APP_Name andView:view andHUD:nil];
}
/// 账号绑定状态
-(void)PushToJudgeBindController {
    
}

/// 消息中心
- (void)PushToMessageCenterController:(DZQUnReadModel *)UnReadModel {
    DZMessageViewController *MsgVC = [[DZMessageViewController alloc] initWithUnReadModel:UnReadModel];
    [self.mainNavi pushViewController:MsgVC animated:YES];
}




@end







