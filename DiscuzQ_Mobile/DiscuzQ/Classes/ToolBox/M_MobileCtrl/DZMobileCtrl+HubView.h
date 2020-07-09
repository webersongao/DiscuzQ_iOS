//
//  DZMobileCtrl+HubView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

NS_ASSUME_NONNULL_BEGIN
/**
 提示框, loading相关
 */
@interface DZMobileCtrl (HubView)

- (void)showHub;
- (void)ajustLoadingHubView;
- (void)showHubWithText:(NSString * _Nullable)text;
- (void)showHubWithText:(NSString * _Nullable)text useDelay:(BOOL)bUse;

- (void)showHub:(BOOL)bShow;

- (void)hideHubView;
- (void)bringHubViewToFront;

/// 不影响手势操作的loading
- (void)showLoadingView:(UIView *)superView;
- (void)hideLoadingView;




@end


NS_ASSUME_NONNULL_END
