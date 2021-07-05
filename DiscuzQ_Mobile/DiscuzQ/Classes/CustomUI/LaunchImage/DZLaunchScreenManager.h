//
//  DZLaunchScreenManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/3/28.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DZLaunchImageView;

@interface DZLaunchScreenManager : NSObject

@property (nonatomic, strong) DZLaunchImageView *launchImageView;

+ (instancetype)Shared;

- (void)setLaunchView;

@end
