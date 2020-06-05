//
//  AppDelegate+SDK.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/14.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+SDK.h"
#import "AppDelegate+Push.h"
#import "AppDelegate+Speech.h"

@implementation AppDelegate (SDK)


-(void)launchSDKConfigWithOptions:(NSDictionary *)launchOptions{
    
    [self launchDoumaoSpeech];
    
//    [self launchPushConfigration:launchOptions];
    
    
}


@end









