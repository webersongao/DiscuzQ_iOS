//
//  DZLaunchScreenManager.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/3/28.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DZLaunchImageView;

@interface DZLaunchScreenManager : NSObject

@property (nonatomic, strong) DZLaunchImageView *launchImageView;

+ (instancetype)shareInstance;

- (void)setLaunchView;

@end
