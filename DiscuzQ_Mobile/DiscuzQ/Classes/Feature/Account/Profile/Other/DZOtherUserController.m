//
//  DZOtherUserController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZOtherUserController.h"
#import "DZOtherScrollView.h"

@interface DZOtherUserController ()<UIScrollViewDelegate>

@property (nonatomic, strong) DZOtherScrollView *otherView;

@end

@implementation DZOtherUserController

- (instancetype)initWithUser:(NSString *)userId
{
    self = [super initWithUser:userId];
    if (self) {
        self.title = @"详细资料";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_OtherUserCtrl];
}

-(void)config_OtherUserCtrl{
    
    [self.view addSubview:self.otherView];
    [self loadOtherUserProfile];
    [self.otherView updateOtherUserListTabView];
    [self configNaviBar:@"dz_list_more" type:NaviItemImage Direction:NaviDirectionRight];
}

-(void)rightBarBtnClick:(UIButton *)button{
    
    [[DZMobileCtrl sharedCtrl].moreMenu showSheetMenuInViewCtrl:self title:@"title" message:@"message" buttonTitleArray:@[@"张三",@"李四",@"王五"] buttonTitleColorArray:@[UIColor.blueColor,UIColor.redColor,UIColor.greenColor] popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
        NSLog(@"wbs");
    } block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        NSLog(@"");
    }];
    
    //    [[DZMobileCtrl sharedCtrl].moreMenu showNaviBarPopTextMenu:button titleArray:@[@"拉黑"] doneBlock:^(NSInteger index) {
    //        [[DZMobileCtrl sharedCtrl] complainUserActionWithUserId:self.user_id];
    //    } dismissBlock:^{
    //    }];
}

-(void)loadOtherUserProfile{
    
    KWEAKSELF
    [self loadUserInfoWithId:self.user_id isMe:NO completion:^(DZQDataUser * dataUser, BOOL success) {
        if (success) {
            // 刷新用户信息
            [weakSelf reloadOtherUserController:dataUser];
        }
    } failure:^(DZQErrorV1 * _Nonnull errorModel) {
        
    }];
}

-(void)reloadOtherUserController:(DZQDataUser *)dataUser{
    
    [self.otherView updateUserHeader:dataUser];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    KSLog(@"WBS  scrollViewDidScroll");
}


-(DZOtherScrollView *)otherView{
    if (!_otherView) {
        _otherView = [[DZOtherScrollView alloc] initWithFrame:KView_OutNavi_Bounds userId:self.user_id];
        _otherView.delegate = self;
    }
    return _otherView;
}

@end
