//
//  DZHomeTestViewController.m
//  DiscuzMobile
//
//  Created by WebersonGao on 2019/12/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZHomeTestViewController.h"
#import "DZSearchController.h"
#import "DZLoginController.h"
#import "DZRegisterController.h"
#import "DZPickerHeader.h"
#import "DZPostSiriViewController.h"
#import "DZRootPostTabController.h"
#import "DZMediaPicker.h"

@interface DZHomeTestViewController ()

@property (nonatomic, copy) NSString *userId;  //!< userId
// 用户名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
// 用户头像
@property (weak, nonatomic) IBOutlet UIImageView *avatarIcon;


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
    
}


//搜索
- (IBAction)searchAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_threadOneWithThreadId:@"3057" completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
        KSLog(@"主题信息获取成功");
    }];
    
}

// 注册
- (IBAction)registerAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_PostListWithThreadId:@"2837" page:1 completion:^(NSArray<DZQDataPost *> *postArr,BOOL hasMore) {
        KSLog(@"查询回复接口[列表] 获取成功");
    }];
    
}

// 阅读
- (IBAction)readerAction:(UIButton *)sender {
    
    DZTabItem *item01 = [[DZTabItem alloc] initWithTitle:@"腾讯柯基" class:[DZBaseViewController class]];
    DZTabItem *item02 = [[DZTabItem alloc] initWithTitle:@"百度辣鸡" class:[DZBaseViewController class]];
    DZTabItem *item03 = [[DZTabItem alloc] initWithTitle:@"阿里粑粑" class:[DZBaseViewController class]];
    
    NSArray *tabArray = @[item01,item02,item03];
    DZRootPostTabController *PostTab = [[DZRootPostTabController alloc] initWithTabArr:tabArray];
    [[DZMobileCtrl sharedCtrl] PushToController:PostTab];
    
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
    
//    NSString *threadId = @"561";    // 多文字，少图片
    NSString *threadId = @"3057";    // 富文本 多图片
//    NSString *threadId = @"2314";  // 文章
//    NSString *threadId = @"3054";  // 视频
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:threadId];
}

// 主题列表 接口
- (IBAction)defautInputAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_threadListWithCate:@"" page:1 completion:^(NSArray<DZQDataThread *> * _Nonnull varModel,BOOL hasMore,BOOL success) {
        if (success) {
            KSLog(@"WBS 主题 列表获取 成功");
        }else{
            KSLog(@"WBS 主题 列表获取 失败");
        }
    }];
    
}

// 分类列表 接口
- (IBAction)siriUIInputAction:(UIButton *)sender {
    
    [[DZNetCenter center] dzx_categoryListWithCompletion:^(NSArray<DZQDataCate *> * _Nonnull varModel, BOOL success) {
        if (success) {
            KSLog(@"WBS 分类 列表获取 成功");
        }else{
            KSLog(@"WBS 分类 列表获取 失败");
        }
    }];
    
}

// 用户信息
- (IBAction)dzqUserInfoAction:(UIButton *)sender {
    
    NSString *userId = self.userId;
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:YES completion:^(DZQResModel * _Nonnull varModel, BOOL success) {
        if (success) {
            KSLog(@"WBS 用户信息 获取 成功");
        }else{
            KSLog(@"WBS 用户信息 获取 失败");
        }
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
    
}

// 登录账号
- (IBAction)dzqUserLoginAction:(UIButton *)sender {
    
    KWEAKSELF
    [[DZNetCenter center] dzx_loginWithName:KTest_UserName password:KTest_PassWord mobile:@"" completion:^(DZQUserModel *userModel,DZQBaseToken *tokenModel,BOOL success) {
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

// 注册 账号
- (IBAction)dzqUserRegisterAction:(UIButton *)sender {
    
    NSString *userName = @"ios_Gao_001";
    NSString *password = @"ios_Gao_pwd";
    [[DZNetCenter center] dzx_registerWithName:userName password:password completion:^(DZQRegModel * _Nonnull varModel, BOOL success) {
        if (success) {
            KSLog(@"WBS 注册账户 成功 ");
        }else{
            KSLog(@"WBS 注册账户 失败 ");
        }
    }];
    
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



@end










