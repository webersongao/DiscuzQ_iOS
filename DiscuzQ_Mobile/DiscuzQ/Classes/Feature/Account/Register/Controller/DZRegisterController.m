//
//  DZRegisterController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/11.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZRegisterController.h"
#import "DZUserRegisterView.h"
#import "DZTextField.h"

@interface DZRegisterController ()
@property (nonatomic,strong) DZUserRegisterView *registerView;
@end

@implementation DZRegisterController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"注册";
    _registerView.delegate = self;
    [self.view addSubview:self.registerView];
    [self dz_bringNavigationBarToFront];
    [_registerView.registerButton addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    KWEAKSELF;
    self.registerView.usertermsView.readTermBlock = ^ {
        [weakSelf readTerms];
    };
}

- (void)readTerms {
    [[DZMobileCtrl sharedCtrl] PushToUserTermController];
}

- (void)registerBtnClick {
    
    [self.view endEditing:YES];
    if (!self.registerView.usertermsView.isAgree) {
        [MBProgressHUD showInfo:@"未同意服务条款"];
        return;
    }
    
    NSString *username = self.registerView.usernameView.inputField.text;
    NSString *password = self.registerView.passwordView.inputField.text;
    NSString *repass = self.registerView.repassView.inputField.text;
    
    if (![DataCheck isValidString:username]) {
        [MBProgressHUD showInfo:@"请输入用户名"];
        return;
    }
    if (![DataCheck isValidString:password]) {
        [MBProgressHUD showInfo:@"请输入密码"];
        return;
    }
    if (![DataCheck isValidString:repass]) {
        [MBProgressHUD showInfo:@"请在确定密码框中再次输入密码"];
        return;
    }
    
    if (![password isEqualToString:repass]) {
        [MBProgressHUD showInfo:@"请确定两次输入的密码相同"];
        return;
    }
    
    [self postRegistData];
}

- (void)postRegistData {
    NSString *username = _registerView.usernameView.inputField.text;
    NSString *password = _registerView.passwordView.inputField.text;
    NSString *repass = _registerView.repassView.inputField.text;
    
    
    if (![repass isEqualToString:password]) {
        [DZMobileCtrl showAlertError:@"密码输入不一致"];
        return;
    }
    
    KWEAKSELF
    [self.HUD showLoadingMessag:@"注册中" toView:self.view];
    
    [[DZNetCenter center] dzx_registerWithName:username password:password completion:^(DZQAuthModel *varModel, BOOL success) {
        [weakSelf.HUD hideAnimated:YES];
        if (!success) {
            [DZMobileCtrl showAlertError:@"注册失败"];
        }else {
            [weakSelf.HUD hide];
            // 考虑直接登录 或者拉取用户信息
            [DZMobileCtrl showAlertError:@"注册成功啦，赶紧去登录吧"];
            [[DZMobileCtrl sharedCtrl] PresentLoginController];
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
    }];
    
}


-(DZUserRegisterView *)registerView{
    if (!_registerView) {
        _registerView = [[DZUserRegisterView alloc] initWithFrame:KView_OutNavi_Bounds];
    }
    return _registerView;
}


@end





