//
//  DZResetPwdController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/17.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZResetPwdController.h"
#import "DZResetPwdView.h"

@interface DZResetPwdController ()
@property (nonatomic,strong) DZResetPwdView *resetView;
@end

@implementation DZResetPwdController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"修改密码";
    [self.view addSubview:self.resetView];
    [_resetView.actionButton addTarget:self action:@selector(submitButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)submitButtonClick {
    
    [self.view endEditing:YES];
    NSString *oldpassword = self.resetView.firstField.inputString;
    NSString *newpassword1 = self.resetView.secendField.inputString;
    NSString *newpassword2 = self.resetView.thirdField.inputString;
    
    if ([DataCheck isValidString:oldpassword] && [DataCheck isValidString:newpassword1] && [DataCheck isValidString:newpassword2]) { // 全部按要求填了
        if (![newpassword1 isEqualToString:newpassword2]) {
            [MBProgressHUD showInfo:@"请确定两次输入的密码相同"];
        } else { // 所有都输入了，去注册
            [self postResetData];
        }
    } else { // 未按要求填或者有空
        if (![DataCheck isValidString:oldpassword]) {
            [MBProgressHUD showInfo:@"请输入旧密码" ];
        } else if (![DataCheck isValidString:newpassword1]) {
            [MBProgressHUD showInfo:@"请输入新密码"];
        } else if (![DataCheck isValidString:newpassword2]) {
            [MBProgressHUD showInfo:@"请重复新密码"];
        }
    }
    
}

- (void)postResetData {
    NSString *oldpassword = self.resetView.firstField.inputString;
    NSString *newpassword1 = self.resetView.secendField.inputString;
    NSString *newpassword2 = self.resetView.thirdField.inputString;
    
    [self.HUD showLoadingMessag:@"正在提交" toView:self.view];
    
    [[DZNetCenter center] dzx_resetPwdWithPassword:oldpassword newPassword:newpassword1 password_confirmation:newpassword2 completion:^(DZQUserV1 *varModel, BOOL success) {
        [self.HUD hide];
        if (success) {
            [MBProgressHUD showInfo:@"修改密码成功，请重新登录"];
            [[DZMobileCtrl sharedCtrl] signoutWithCompletion:nil];
            [self.navigationController popViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:DZ_UserSigOut_Notify object:nil];
        }else{
            [MBProgressHUD showInfo:@"修改密码失败~~"];
        }
    }];
    
}


-(DZResetPwdView *)resetView{
    if (!_resetView) {
        _resetView = [[DZResetPwdView alloc] initWithFrame:KView_OutNavi_Bounds];
    }
    return _resetView;
}

@end
