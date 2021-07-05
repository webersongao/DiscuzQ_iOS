//
//  DZHomeTestViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZHomeTestViewController.h"
#import "DZSearchViewController.h"
#import "DZLoginController.h"
#import "DZRegisterController.h"
#import "DZPickerHeader.h"
#import "DZWebOAuthView.h"
#import "DZShadowAlertManager.h"
#import "DZPostSiriViewController.h"
#import "DZMediaPicker.h"
#import "DZQApiListController.h"

#import <SDWebImage.h>

@interface DZHomeTestViewController ()
{
    NSString *m_tempStr;
}
@property (nonatomic, copy) NSString *userId;  //!< userId
// 用户名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
// 用户头像
@property (weak, nonatomic) IBOutlet UIImageView *avatarIcon;
@property (weak, nonatomic) IBOutlet UIButton *stateButton;


@end

@implementation DZHomeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHomeTestViewController];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

-(void)configHomeTestViewController{
    
    self.nameLabel.text = @"<--熊猫看书-->";
    self.avatarIcon.layer.cornerRadius = 25.f;
    self.stateButton.backgroundColor = KGreen_Color;
}


// 登录账号
- (IBAction)dzqUserLoginAction:(UIButton *)sender {
    
    KWEAKSELF
    [[DZNetCenter center] dzx_loginWithName:KTest_UserName password:KTest_PassWord mobile:@"" completion:^(DZQUserV1 *userModel,DZQTokenV1 *tokenModel,BOOL success) {
        if (success) {
            KSLog(@"WBS 登录成功 ");
            weakSelf.userId = userModel.user_id;
            weakSelf.nameLabel.text = userModel.username;
            [weakSelf.avatarIcon dz_setImageWithURL:userModel.avatarUrl];
        }else{
            KSLog(@"WBS 登录失败 ");
        }
    }];
    
}

//搜索
- (IBAction)searchAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_threadOneWithThreadId:@"3057" completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
        KSLog(@"主题信息获取成功");
    }];
    
}

// 列表
- (IBAction)readerAction:(UIButton *)sender {
    
    DZWebOAuthView *webauth = [[DZWebOAuthView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    [webauth loadRequestWithCodeUrl:@"https://discuz.chat/data/attributes/captcha"];
    [[DZShadowAlertManager sharedManager] showScaleAlertView:webauth bDismiss:YES];
    
}


// 退出账号
- (IBAction)userLogOutAction:(UIButton *)sender {
    
    KWEAKSELF
    [[DZNetCenter center] dzx_loginOutWithCompletion:^{
        KSLog(@"WBS 退出账户 成功 ");
        weakSelf.userId = nil;
        weakSelf.avatarIcon.image = nil;
        weakSelf.nameLabel.text = @"<--熊猫看书-->";
    }];
    
}

// 底部最大按钮 状态
- (IBAction)stateButtonAction:(UIButton *)sender {
    
//    [[DZNetCenter center] dzx_followShipDeleteWithUser:@"12883" completion:^(DZQDataFollow * _Nonnull dataFollow, BOOL success) {
//        if (success) {
//            NSLog(@"WBS  关注成功");
//        }else{
//            NSLog(@"WBS  ~关注失败~");
//        }
//    }];
    
}

/// 接口列表
- (IBAction)apiListAction:(UIButton *)sender {
    
    NSString *avaUrl = @"https://discuz.chat/images/groups/group-10.svg";
    
    NSString *aassnglj = @"http://1.116.86.125/favicon.ico";
    
    [self.stateButton setTitle:@"猫" forState:UIControlStateNormal];
    [self.stateButton dz_setImageWithURL:aassnglj forState:UIControlStateNormal];
    
    
    //    DZQApiListController *ListVC = [[DZQApiListController alloc] init];
    //
    //    [[DZMobileCtrl sharedCtrl] PushToController:ListVC];
    
}




#pragma mark   /********************* API 测试 *************************/




// 注册
- (IBAction)registerAction:(UIButton *)sender {
    
    NSString *userName = @"ios_Gao_001";
    NSString *password = @"ios_Gao_pwd";
    [[DZNetCenter center] dzx_registerWithName:userName password:password completion:^(DZQAuthV1 * _Nonnull varModel, BOOL success) {
        if (success) {
            KSLog(@"WBS 注册账户 成功 ");
        }else{
            KSLog(@"WBS 注册账户 失败 ");
        }
    }];
}



// 设置
- (IBAction)settingAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_ShowAvatarPickerSheet:self.navigationController];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        KSLog(@"WBS 照片获取成功");
    };
}

#pragma mark   /********************* 图片 视频 选择器 *************************/

// 选取 单张图片
- (IBAction)messageAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerToPickImage:DZPicker_singlePic naviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        KSLog(@"WBS 照片获取成功");
    };
}

// 选取 多张图片
- (IBAction)postThreadAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerToPickImage:DZPicker_MuitlplePic naviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        KSLog(@"WBS 照片获取成功");
    };
}

// 拍摄图片
- (IBAction)userLoginAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerTo_TakeImageWithNaviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        KSLog(@"WBS 照片获取成功");
    };
    
}


// 选取 单个视频
- (IBAction)bookStoreAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerToPickVideo:DZPicker_Video naviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_VideoBlock = ^(NSArray<UIImage *> *prePicArr , NSArray<PHAsset *> *AssetArr,NSArray<NSString *> *videoPathArr) {
        KSLog(@"WBS 照片获取成功");
    };
}

// 选取 多个视频
- (IBAction)applePayAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerToPickVideo:DZPicker_Video naviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_VideoBlock = ^(NSArray<UIImage *> *prePicArr , NSArray<PHAsset *> *AssetArr,NSArray<NSString *> *videoPathArr) {
        KSLog(@"WBS 照片获取成功");
    };
}

// 拍摄 视频
- (IBAction)appAdvertAction:(UIButton *)sender {
    
    [[DZMediaPicker Shared] dz_PickerTo_TakeVideoWithNaviCtrl:self.navigationController];
    [DZMediaPicker Shared].media_VideoBlock = ^(NSArray<UIImage *> *prePicArr , NSArray<PHAsset *> *AssetArr,NSArray<NSString *> *videoPathArr) {
        KSLog(@"WBS 照片获取成功");
    };
    
}


#pragma mark   /********************* 已使用 **********************/

// 详情页 接口
- (IBAction)siriInputAction:(UIButton *)sender {
    
    //    NSString *threadId = @"4888";    // 多文字，带引用格式
    //    NSString *threadId = @"5000";    // 富文本 付费文章
    NSString *threadId = @"4987";    // 富文本 超链接 带附件
    //    NSString *threadId = @"2314";  // 文章
    //    NSString *threadId = @"3054";  // 视频
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:threadId];
}

// 主题列表 接口
- (IBAction)defautInputAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_allEmojiListWithCompletion:^(NSArray<DZQDataEmoji *> * varModel, BOOL success) {
        if (success) {
            KSLog(@"WBS 表情包 数据 成功");
        }else{
            KSLog(@"WBS 表情包 数据 获取失败");
        }
    }];
    
}

//  接口
- (IBAction)siriUIInputAction:(UIButton *)sender {
    
    
}

// 用户信息
- (IBAction)dzqUserInfoAction:(UIButton *)sender {
    
    NSString *userId = self.userId;
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:YES completion:^(DZQDataUser * dataUser, BOOL success) {
        if (success) {
            KSLog(@"WBS 用户信息 获取 成功");
        }else{
            KSLog(@"WBS 用户信息 获取 失败");
        }
    } failure:^(DZQErrorV1 * _Nonnull varModel) {
        
    }];
}

// 通知列表
- (IBAction)weixinLoginAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_notiListWithTypeFilter:nil completion:^(NSArray<DZQDataNoti *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
        if (success) {
            KSLog(@"WBS 通知 列表获取 成功");
        }else{
            KSLog(@"WBS 通知 列表获取 失败");
        }
    }];
    
}

// 单条主题
- (IBAction)dzqSingleThreadAction:(UIButton *)sender {
    
//    [[DZMobileCtrl sharedCtrl] PushToThreadPublishController];
    
    m_tempStr = @"";
    NSRange subRange = NSMakeRange(0, -2);
    BOOL isCanUse = [self canUseRange:subRange];
    
    
    NSRange range = NSMakeRange(81, 65);
    NSRange stringRange = NSMakeRange(0, 119);
    
    if (NSMaxRange(range) <= NSMaxRange(stringRange)) {
        NSLog(@"1111111111111111111");
    }else{
        NSLog(@"2222222222222222222");
    }
    NSString *subString = [m_tempStr substringWithRange:subRange];
    
    NSLog(@"WBS subString is %@",subString);
    
}


- (BOOL)canUseRange:(NSRange)range
{
    
    NSRange stringRange = NSMakeRange(0, m_tempStr.length);
    if (range.location >= 0 && ((range.location >= stringRange.location) && (NSMaxRange(range) <= NSMaxRange(stringRange)))) {
        return YES;
    }
    return NO;
}




@end










