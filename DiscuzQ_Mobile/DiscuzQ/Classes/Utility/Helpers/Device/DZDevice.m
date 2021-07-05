//
//  DZDevice.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/7/12.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZDevice.h"
#define CC_MD5_DIGEST_LENGTH 16
#import <CommonCrypto/CommonDigest.h>

@implementation DZDevice


NSUInteger DeviceSystemMajorVersion()
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}


/**
 获取icon名字

 @return iconname
 */
+ (NSString *)getIconName {
    NSString *logoName = @"";
    if ([DataCheck isValidArray:[[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIcons"] objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"]]) {
        NSArray *iconArr = [[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIcons"] objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"];
        logoName = iconArr.lastObject;
    }
    return logoName;
}


/**
 获取手机当前语言

 @return 语言种类
 */
+ (NSString*)getPreferredLanguage {
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    
    KSLog(@"%@",allLanguages);
    KSLog(@"当前语言:%@", preferredLang);
    return preferredLang;
    
}

+ (BOOL)screenIsPortrait
{
    
    BOOL bPortrait = YES;//竖
    
    //UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    //int statusBarOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait || [UIDevice currentDevice].orientation == UIDeviceOrientationPortraitUpsideDown)
    {
        //
    }
    else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)
    {
        bPortrait = NO;
    }
    else
    {
        if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            //
        }
        else
        {
            bPortrait = NO;
        }
        
    }
    return bPortrait;
}

+ (BOOL)screenIsPortraitBystatusBarOrientation
{
    BOOL bPortrait = YES;
    if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait
       || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft
            || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight)
    {
        bPortrait = NO;
    }
    return bPortrait;
}

@end
