//
//  DZLaunchScreenManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/3/28.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZLaunchScreenManager.h"
#import "UIView+TYLaunchAnimation.h"
#import "TYLaunchFadeScaleAnimation.h"
#import "UIImage+TYLaunchImage.h"
#import "DZLaunchImageView.h"

@implementation DZLaunchScreenManager

+ (instancetype)Shared {
    static DZLaunchScreenManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DZLaunchScreenManager alloc] init];
    });
    return manager;
}

- (void)setLaunchView {
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]) {
        // 开机启动画 广告页面
        self.launchImageView = [[DZLaunchImageView alloc] initWithImage:[UIImage ty_getLaunchImage]];
        [self.launchImageView addInWindow];
        // 不是第一次启动 拉取数据，设置开机启动动画
//        [self anylyLaunchData:responseObject];
        [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication].delegate window] animated:NO];
    }
}

- (void)anylyLaunchData:(id)resp {
    
    
    //    [self test];
    //    return;
    KWEAKSELF;
    [self.launchImageView showInWindowWithAnimation:[TYLaunchFadeScaleAnimation fadeAnimationWithDelay:5.0] completion:^(BOOL finished) {
        KSLog(@"finished");
    }];
    if ([DataCheck isValidString:[[[resp objectForKey:@"Variables"] objectForKey:@"openimage"] objectForKey:@"imgsrc"]]) {
        NSString *openimageStr = [[[resp objectForKey:@"Variables"] objectForKey:@"openimage"] objectForKey:@"imgsrc"];
        
        self.launchImageView.URLString = @"";
        // 点击广告block
        [self.launchImageView setClickedImageURLHandle:^(NSString *URLString) {
            [weakSelf pushAdViewCntroller:[[[resp objectForKey:@"Variables"] objectForKey:@"openimage"] objectForKey:@"imgurl"]];
        }];
    } else {
        self.launchImageView.URLString = @"";
    }
}

- (void)test {
    KWEAKSELF;
    [self.launchImageView showInWindowWithAnimation:[TYLaunchFadeScaleAnimation fadeAnimationWithDelay:5.0] completion:^(BOOL finished) {
        KSLog(@"finished");
    }];
    NSString *openimageStr = @"http://5b0988e595225.cdn.sohucs.com/images/20190614/050fa6c11ad14234a901f9f633f33126.jpeg";
    self.launchImageView.URLString = openimageStr;
    // 点击广告block
    [self.launchImageView setClickedImageURLHandle:^(NSString *URLString) {
        [weakSelf pushAdViewCntroller:@"https://www.baidu.com"];
    }];
}

// 点击启动页跳转的控制器，webview
- (void)pushAdViewCntroller:(NSString *)Url {
    
    [[DZMobileCtrl sharedCtrl] PushToWebViewController:Url];
    
}


@end
