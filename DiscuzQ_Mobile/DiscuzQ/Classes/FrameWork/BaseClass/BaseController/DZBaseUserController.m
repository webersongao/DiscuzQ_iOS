//
//  DZBaseUserController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseUserController.h"

@interface DZBaseUserController ()

@end

@implementation DZBaseUserController

- (instancetype)initWithUser:(NSString *)userId
{
    self = [super init];
    if (self) {
        _user_id = checkNull(userId);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view dz_showEmptyView];
    // Do any additional setup after loading the view.
}


-(void)loadUserInfoWithId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQDataUser * dataUser,BOOL success))completion failure:(void (^)(DZQErrorV1 * errorModel))failure{
    
    [[DZNetCenter center] dzx_userInfoWithUserId:userId isMe:isMe completion:^(DZQDataUser * dataUser, BOOL success) {
        if (isMe) {
            completion(dataUser,success);
        }else{
            completion(dataUser,success);
        }
    } failure:^(DZQErrorV1 * _Nonnull varModel) {
        if (varModel.status == 401) {
            [[DZMobileCtrl sharedCtrl] signoutWithCompletion:nil];
            [[DZMobileCtrl sharedCtrl] PresentLoginController];
        }else{
            
        }
        failure(varModel);
    }];
}



@end
