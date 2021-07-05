//
//  DZRootPublishController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootPublishController.h"
#import "DZLocalThreadEditerView.h"
#import "DZPostTool.h"
#import "DZWebOAuthView.h"
#import "DZShadowAlertManager.h"

@interface DZRootPublishController ()

@property (nonatomic, strong) DZLocalThreadEditerView *editerView;  //!< 属性注释

@end

@implementation DZRootPublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_PostTabController];
    [self.view addSubview:self.editerView];
    self.view.backgroundColor = KLightLine_Color;
}

-(void)config_PostTabController{
    
    [self configNaviBar:@"发布" type:NaviItemText Direction:NaviDirectionRight];
}

-(DZLocalThreadEditerView *)editerView{
    if (!_editerView) {
        CGRect editRect = CGRectMake(0, KNavi_ContainStatusBar_Height, self.view.width, KView_OutNavi_Bounds.size.height - KTabbar_Gap);
        _editerView = [[DZLocalThreadEditerView alloc] initWithFrame:editRect];
    }
    return _editerView;
}


-(void)rightBarBtnClick:(UIButton *)button{
    
    [self.view endEditing:YES];
    DZThreadDraftM *localDraft = self.editerView.localDraft;
    if (![DZPostTool isDraftCanPublish:localDraft]) {
        return;
    }
    [[DZMobileCtrl sharedCtrl] showCaptchaAuthWithCompletion:^(NSDictionary *verDict, DZState *state) {
        if (state.success) {
            [self publishLocalThread:localDraft captcha:verDict];
        }else{
            NSLog(@"WBS  验证码错误");
        }
    }];
}


-(void)publishLocalThread:(DZThreadDraftM *)localDraft captcha:(NSDictionary *)captchaDict{
    
    [DZPostTool publishLocalThread:localDraft captcha:captchaDict completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
        if (success) {
            NSLog(@"WBS 发布主题成功了。。。。。");
        }
        [DZMobileCtrl showAlertSuccess:@"发布成功"];
        [[DZMobileCtrl sharedCtrl] PopToPreviousController:YES];
    } failure:^(DZQErrorV1 * _Nonnull error) {
        [DZMobileCtrl showAlertError:@"发布失败"];
    }];
    
   
}

@end

