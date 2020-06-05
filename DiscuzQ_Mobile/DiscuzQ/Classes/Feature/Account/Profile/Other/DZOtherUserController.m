//
//  DZOtherUserController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZOtherUserController.h"
#import "DZOtherScrollView.h"

@interface DZOtherUserController ()<UIScrollViewDelegate>

@property (nonatomic ,copy) NSString *user_id;
@property (nonatomic, strong) DZOtherScrollView *otherView;

@end

@implementation DZOtherUserController

- (instancetype)initWithAuthor:(NSString *)authorid
{
    self = [super init];
    if (self) {
        self.title = @"详细资料";
        self.user_id = checkNull(authorid);;
    }
    return self.user_id.length ? self : nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_OtherUserCtrl];

}

-(void)config_OtherUserCtrl{
    
    [self.view addSubview:self.otherView];
    [self loadOtherUserProfile];
    
}


-(void)loadOtherUserProfile{
    
    KWEAKSELF
    [[DZNetCenter center] dzx_userInfoWithUserId:self.user_id isMe:NO completion:^(DZQResModel * _Nonnull varModel, BOOL success) {
        if (!success) {
            [DZMobileCtrl showAlertInfo:@"获取资料失败"];
        }else{
            // 刷新用户信息
            [weakSelf reloadOtherUserController:varModel];
        }
    }];
}

-(void)reloadOtherUserController:(DZQResModel *)resModel{
    
    [self.otherView updateUserHeader:(DZQBaseUser *)resModel.dataBody.firstObject.attributes];
    
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
