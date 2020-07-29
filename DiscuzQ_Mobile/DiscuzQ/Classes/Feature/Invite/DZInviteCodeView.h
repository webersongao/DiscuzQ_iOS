//
//  DZInviteCodeView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScaleView.h"
#import "DZShadowAlertManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZInviteCodeView : DZScaleView

- (instancetype)initWithCode:(NSString *)code user:(DZQBaseUser *)userModel;



@end

NS_ASSUME_NONNULL_END
