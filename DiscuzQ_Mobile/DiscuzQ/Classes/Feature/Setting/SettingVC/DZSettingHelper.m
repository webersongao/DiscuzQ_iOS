//
//  DZSettingHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSettingHelper.h"
#import "DZEmailHelper.h"

@implementation DZSettingHelper

static DZSettingHelper *instance = nil;

+(instancetype)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)didTappedTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row == 0) {
                [self TransTo_LocalSiteinfo];
            }else if (indexPath.row == 1) {
                [self TransTo_configSiteDomain];
            }else if (indexPath.row == 2) {
                [self  TransTo_cleanLocalCache:tableView];
            }
        }
            break;
        case 1: {
            if (indexPath.row == 0) {
                [self TransTo_feedBackAboutApp];
            }else if (indexPath.row == 1) {
                [self TransTo_evaluateApptore];
            }else if (indexPath.row == 2) {
                [self TransTo_shareCurrentAPP:tableView.superview];
            }
        }
            break;
        case 2: {
            if (indexPath.row == 0) {
                [self TransTo_scanSiteUserTerms];
            }else if (indexPath.row == 1) {
                [self TransTo_LocalAboutAPP];
            }
        }
            break;
        default:
            break;
    }
}

// 反馈
- (void)TransTo_feedBackAboutApp {
    [[DZEmailHelper Helper] prepareToSendEmail:nil];
}

// 配置站点域名
- (void)TransTo_configSiteDomain {
    [[DZMobileCtrl sharedCtrl] PushToDomainSettingController];
}

- (void)TransTo_evaluateApptore {
    [[DZMobileCtrl sharedCtrl] PushToAppStoreWebview];
}

- (void)TransTo_shareCurrentAPP:(UIView *)faterView {
    [[DZMobileCtrl sharedCtrl] shareMyMobileAPPWithView:faterView];
}


// 关于 app （版本号信息）
- (void)TransTo_LocalAboutAPP {
    [[DZMobileCtrl sharedCtrl] PushToAppAboutViewController];
}

-(void)TransTo_LocalSiteinfo{
    [[DZMobileCtrl sharedCtrl] PushToSiteInfoViewController];
}

- (void)TransTo_scanSiteUserTerms {
    [[DZMobileCtrl sharedCtrl] PushToUserTermController];
}

- (void)localUserALoginout {
    
    if (![[DZMobileCtrl sharedCtrl] isLogin]) {
        [[DZMobileCtrl sharedCtrl] transToLogin];
        return;
    }
    
    ZHAlertView *alertV = [[ZHAlertView alloc] initWithTitle:@"退出登录？" contentText:@"您确定退出？退出将不能体验全部功能。" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
    
    alertV.rightBlock = ^{
        [[DZMobileCtrl sharedCtrl] PopToPreviousController:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:DZ_UserSigOut_Notify object:nil];
    };
    [alertV show];
}

///  清除缓存
-(void)TransTo_cleanLocalCache:(UITableView *)tableView {
    
    [[DZMobileCtrl sharedCtrl] showHub];
    [[DZMobileCtrl sharedCtrl] cleanLocalDataCache:^{
        [[DZMobileCtrl sharedCtrl] hideHubView];
        [DZMobileCtrl showAlertSuccess:@"清理成功！"];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:2 inSection:0];
        [tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
    }];
}



@end
