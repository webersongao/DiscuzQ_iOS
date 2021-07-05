//
//  DZQDelegate+SDK.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/14.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+SDK.h"
#import "AppDelegate+Push.h"
#import "AppDelegate+Speech.h"
#import "DZSDKCenter.h"

@implementation DZQDelegate (SDK)


-(void)launchSDKConfigWithOptions:(NSDictionary *)launchOptions{
    
    [self launchDoumaoSpeech];
    
    // 友盟参数配置
    [[DZSDKCenter Shared] initUMengSDKConfigure];
    
//    [self launchPushConfigration:launchOptions];
    
    
}


@end









