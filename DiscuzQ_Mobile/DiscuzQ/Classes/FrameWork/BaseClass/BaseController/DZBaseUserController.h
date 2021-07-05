//
//  DZBaseUserController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZBaseUserController : DZBaseViewController

@property (nonatomic ,copy, readonly) NSString *user_id;

- (instancetype)initWithUser:(NSString *)userId;

-(void)loadUserInfoWithId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQDataUser * dataUser,BOOL success))completion failure:(void (^)(DZQErrorV1 * errorModel))failure;


@end

NS_ASSUME_NONNULL_END
