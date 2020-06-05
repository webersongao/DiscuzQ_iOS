//
//  DZLoginController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/10.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZLoginController.h"
#import <ShareSDK/ShareSDK.h>
#import "DZUserLoginView.h"
#import "DZTextField.h"
#import "ZHPickView.h"
#import "DZShareCenter.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>

@interface DZLoginController ()<UITextFieldDelegate>

@property (nonatomic, strong) DZUserLoginView *loginView;

@end


@implementation DZLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self configLoginCtrlView];
    [self setViewDelegate];
    [self setViewAction];
}

- (void)setViewDelegate {
    self.loginView.delegate = self;
    self.loginView.nameView.inputField.delegate = self;
    self.loginView.pwordView.inputField.delegate = self;
}

-(void)configLoginCtrlView{
    [self configNaviBar:@"注册" type:NaviItemText Direction:NaviDirectionRight];
    [self.view addSubview:self.loginView];
}

- (void)setViewAction {
    [self.loginView.loginBtn addTarget:self action:@selector(loginBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.forgetBtn addTarget:self action:@selector(findPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.qqBtn addTarget:self action:@selector(loginWithQQAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.loginView.wechatBtn addTarget:self action:@selector(loginWithWeiXinAction) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)leftBarBtnClick {
    [self.view endEditing:YES];
    NSDictionary *userInfo = @{@"type":@"cancel"};
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_ConfigSelectedIndex_Notify object:nil userInfo:userInfo];
    [super leftBarBtnClick];
}
#pragma mark - 注册
- (void)rightBarBtnClick {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:NO completion:nil];
    [[DZMobileCtrl sharedCtrl] PresentRegisterController];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag==103) {
        [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    } else {
        [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    }
    return YES;
}

#pragma mark   /********************* 交互事件 *************************/

- (void)findPasswordAction {
    [[DZMobileCtrl sharedCtrl] PushToResetPwdController];
}


#pragma mark - qq登录
- (void)loginWithQQAction {
    [self.HUD showLoadingMessag:@"" toView:self.view];
    [[DZSDKShareCenter shareInstance] loginWithQQSuccess:^(id  _Nullable postData, id  _Nullable getData) {
        [self thirdConnectWithService:postData getData:getData];
    } finish:^{
        [self.HUD hide];
    }];
}

#pragma mark - 微信登录
- (void)loginWithWeiXinAction {
    [self.HUD showLoadingMessag:@"" toView:self.view];
    [[DZSDKShareCenter shareInstance] loginWithWeiXinSuccess:^(id  _Nullable postData, id  _Nullable getData) {
        [self thirdConnectWithService:postData getData:getData];
    } finish:^{
        [self.HUD hide];
    }];
}

#pragma mark - 账号密码登录
-(void)loginBtnClickAction {
    [self.view endEditing:YES];
    
    NSString *username = self.loginView.nameView.inputField.text;
    NSString *password = self.loginView.pwordView.inputField.text;
    
#ifndef MACRO_PRODUCT
    username = KTest_UserName;
    password = KTest_PassWord;
#endif
    
    if (![DZLoginModule checkLoginName:username Pwd:password]) {
        return;
    }
    
    KWEAKSELF
    [self.HUD showLoadingMessag:@"登录中" toView:self.view];
    [[DZNetCenter center] dzx_loginWithName:username password:password mobile:@"" completion:^(DZQUserModel *userModel,DZQBaseToken *tokenModel,BOOL success) {
        [weakSelf.HUD hide];
        if (success) {
            [weakSelf updateUserResInfo:tokenModel];
            [DZMobileCtrl showAlertSuccess:@"登陆成功"];
        }else{
            [DZMobileCtrl showAlertError:@"登录失败"];
        }
    }];
    
}

// 第三方登录处理
- (void)thirdConnectWithService:(NSDictionary *)dic getData:(NSDictionary *)getData {
    KSLog(@"WBS  微信 或 QQ 登录 .....");
}


#pragma mark - 请求成功操作
- (void)updateUserResInfo:(DZQBaseToken *)tokenModel {
    [super updateUserWhenSuccess:tokenModel];
    [self dz_PopCurrentViewController];
}

#pragma mark   /********************* 初始化 *************************/

-(DZUserLoginView *)loginView{
    if (!_loginView) {
        BOOL isQQ = YES;// [ShareSDK isClientInstalled:SSDKPlatformTypeQQ];
        BOOL isWechat = YES;//[ShareSDK isClientInstalled:SSDKPlatformTypeWechat];
        _loginView = [[DZUserLoginView alloc] initWithFrame:KView_OutNavi_Bounds isQQ:isQQ isWx:isWechat];
    }
    return _loginView;
}


@end






