//
//  DZMobileCtrl+Config.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/7.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Config.h"

@implementation DZMobileCtrl (Config)

// 进行数据的初始化配置
-(void)cofigLocalDataInfo{
    self.User = [DZLocalContext shared].GetLocalUser;
    KSLog(@"进行数据的初始化配置");
}

@end
