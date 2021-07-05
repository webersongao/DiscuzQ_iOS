//
//  LoginBaseController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2017/7/12.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "LoginBaseController.h"
#import "DZPushCenter.h"

@interface LoginBaseController ()<UIScrollViewDelegate>

@end

@implementation LoginBaseController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = KWhite_Color;
    [self configNaviBar:@"navi_reader_down" type:NaviItemImage Direction:NaviDirectionLeft];
}

#pragma mark - 请求成功操作
- (void)updateUserWhenSuccess:(DZQTokenV1 *)tokenModel{
    
    [[DZPushCenter Shared] configPush]; // 设置推送
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_LoginedRefreshInfo_Notify object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_RefreshUserCenter_Notify object:nil]; // 获取资料
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_CollectionInfoRefresh_Notify object:nil]; // 板块列表刷新
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UITabBarController *tabbBarVC = (UITabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    UINavigationController *navVC = tabbBarVC.childViewControllers[tabbBarVC.selectedIndex];
    if (navVC.childViewControllers.count == 1 && !self.isTabbarSelected) {
        NSDictionary *userInfo = @{@"type":@"loginSuccess"};
        [[NSNotificationCenter defaultCenter] postNotificationName:DZ_ConfigSelectedIndex_Notify object:nil userInfo:userInfo];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


-(void)leftBarBtnClick:(UIButton *)button{
    [self dz_PopCurrentViewController];
}




@end









