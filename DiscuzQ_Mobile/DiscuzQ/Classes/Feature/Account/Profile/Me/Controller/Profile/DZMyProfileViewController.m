//
//  DZMyProfileViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyProfileViewController.h"
#import "DZMediaPicker.h"

@interface DZMyProfileViewController ()


@end

@implementation DZMyProfileViewController

- (instancetype)init{
    self = [super initWithUser:[DZMobileCtrl sharedCtrl].User.user_id];
    if (self) {
        self.title = @"账号详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocalUserDetailInfo];
}


-(void)loadLocalUserDetailInfo{
    
    [self loadUserInfoWithId:self.user_id isMe:YES completion:^(DZQDataUser * _Nonnull dataUser, BOOL success) {
        
    } failure:^(DZQErrorV1 * _Nonnull errorModel) {
        
    }];
}


-(void)sss{
    
    //    [[DZMediaPicker Shared] dz_ShowAvatarPickerSheet:self.navigationController];
    //    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
    //        [weakSelf uploadUserAvatarImage:imageArr.firstObject];
    //    };
    
}

- (void)uploadUserAvatarImage:(UIImage *)image {
    
    [self.HUD showLoadingMessag:@"上传中" toView:self.view];
    [self.HUD hide];
    [MBProgressHUD showInfo:@"上传成功"];
}




@end
