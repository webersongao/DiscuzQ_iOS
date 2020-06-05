//
//  DZUserViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserViewController.h"
#import "DZUserListView.h"

#import "UIAlertController+Extension.h"
#import "DZVerticalButton.h"
//#import "DZPickerHeader.h"
#import "DZMediaPicker.h"
#import "UIImage+Limit.h"

@interface DZUserViewController ()

@property(nonatomic,strong) DZUserListView *listView;
@property (nonatomic, strong) DZQUserModel *userModel;

@end

@implementation DZUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config_UserViewController];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

-(void)config_UserViewController{
    
    [self config_UserView];
    [self config_listTouchAction];
    
    [self loadUserinfoData];
    [self addUserListNotify];
    [self.listView updateLocalList:[DZUserItemModel localListData]];
}


#pragma mark - 设置导航栏
-(void)config_UserView{
    self.title = @"我的";
    [self.view addSubview:self.listView];
    self.listView.backgroundColor = [UIColor whiteColor];
    [self configNaviBar:@"navi_bar_message" type:NaviItemImage Direction:NaviDirectionLeft];
    [self configNaviBar:@"navi_setting" type:NaviItemImage Direction:NaviDirectionRight];
}

-(void)leftBarBtnClick{
    [[DZMobileCtrl sharedCtrl] PushToMessageCenterController:self.userModel.typeUnreadNotifications];
}
- (void)rightBarBtnClick {
    [[DZMobileCtrl sharedCtrl] PushToSettingViewController];
}

- (void)notiReloadData {
    [self loadUserinfoData];
    [self.listView setContentOffset:CGPointZero animated:YES];
}


-(void)loadUserinfoData {
    
    // 未登录，直接跳转
    if (![self isLogin]) {
        [self.listView.mj_header endRefreshing];
        return;
    }
    
    [self.HUD showLoadingMessag:@"拉取信息" toView:self.view];
    KWEAKSELF
    NSString *userId = [DZMobileCtrl sharedCtrl].User.user_id;
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:YES completion:^(DZQResModel * varModel, BOOL bSuccess) {
        [weakSelf.HUD hide];
        if (!bSuccess) {
            [DZMobileCtrl showAlertInfo:@"获取资料失败"];
        }else{
            // 刷新用户信息
            [weakSelf reloadUserController:varModel];
        }
        [weakSelf.listView.mj_header endRefreshing];
    }];
    
}

-(void)reloadUserController:(DZQResModel *)VarModel{
    
    self.userModel = (DZQUserModel *)VarModel.dataBody.firstObject.attributes;
    DZQProfileRelationModel *relateM = (DZQProfileRelationModel *)VarModel.dataBody.firstObject.relationships;
    
    if (self.userModel.unreadNotifications) {
        [self configNaviBar:@"navi_bar_message_new" type:NaviItemImage Direction:NaviDirectionLeft];
    }else{
        [self configNaviBar:@"navi_bar_message" type:NaviItemImage Direction:NaviDirectionLeft];
    }
    
    [self.listView.headView updateUserListHeader:self.userModel relate:relateM];
}

#pragma mark   /********************* 响应事件 *************************/

-(void)localUserListAction:(cellAction)aAction{
    switch (aAction) {
        case cell_avatar:          // 更换头像
        {
            [self modifyAvatarAction];
        }
            break;
        case cell_profile:          // 个人主页
        {
            [[DZMobileCtrl sharedCtrl] PushToMyProfileViewController];
        }
            break;
        case cell_fans:          //我的粉丝
        case cell_follow:        // 我的关注
        {
            [[DZMobileCtrl sharedCtrl] PushToMyFriendListControlle:self.userModel.user_id];
        }
            break;
        case cell_topic:          // 我的帖子（主题）
        {
            [[DZMobileCtrl sharedCtrl] PushToMyThreadListController];
        }
            break;
        case cell_draft:          // 草稿箱
        {
            [[DZMobileCtrl sharedCtrl] PushToMyDraftListViewController];
        }
            break;
        case cell_colorMode:          // 夜间模式
        {
            // themeSwitchModeAction 内部已处理
            //            [DZMobileCtrl showAlertInfo:@"邀请功能暂未开启"];
        }
            break;
        case cell_wallet:          // 我的钱包
        {
            [[DZMobileCtrl sharedCtrl] PushToMyWalletViewController];
        }
            break;
        case cell_favorite:          // 我的收藏
        {
            [[DZMobileCtrl sharedCtrl] PushToMyCollectionController];
        }
            break;
        case cell_invate:          // 我的邀请码
        {
            [DZMobileCtrl showAlertInfo:@"邀请功能暂未开启"];
        }
            break;
        default:
            break;
    }
    
}


- (void)localUserLoginout {
    [DZLoginModule signoutWithCompletion:^{
        [self reloadUserController:nil];
    }];
}

- (void)modifyAvatarAction {
    KWEAKSELF;
    [[DZMediaPicker Shared] dz_ShowAvatarPickerSheet:self.navigationController];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        [weakSelf uploadUserAvatarImage:imageArr.firstObject];
    };
}

- (void)uploadUserAvatarImage:(UIImage *)image {
    
    [self.HUD showLoadingMessag:@"上传中" toView:self.view];
    [self.HUD hide];
    [MBProgressHUD showInfo:@"上传成功"];
}


#pragma mark   /********************* 初始化配置 *************************/

// toobar 点击事件
- (void)config_listTouchAction {
    KWEAKSELF;
    self.listView.touchAction = ^(cellAction action) {
        [weakSelf localUserListAction:action];
    };
    
    self.listView.headView.headerAction = ^(cellAction action) {
        if ([weakSelf isLogin]) {
            [weakSelf localUserListAction:action];
        }
    };
    
    // 下拉刷新
    self.listView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadUserinfoData];
    }];
}

- (void)addUserListNotify {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiReloadData) name:DZ_RefreshUserCenter_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localUserLoginout) name:DZ_UserSigOut_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiReloadData) name:DZ_DomainUrlChange_Notify object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(DZUserListView *)listView{
    if (!_listView) {
        _listView = [[DZUserListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _listView;
}







@end
