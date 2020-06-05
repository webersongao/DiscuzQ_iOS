//
//  AppDelegate+Launch.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+Launch.h"
#import "AppDelegate+Config.h"
#import "DZLaunchScreenManager.h"
#import "DZInstroductionView.h"

@implementation AppDelegate (Launch)


-(void)loadAppLaunchScreenView{
 
    //    [[DZLaunchScreenManager shareInstance] setLaunchView];
}


-(void)launch_WhenApplicationDidBecomeActive{
   
    #pragma mark - 添加首次使用指导
    if ([self isFirstInstall]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"COOKIEVALU"];
        //        // 首次打开APP
        //        DZInstroductionView *helpView = [[DZInstroductionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //        [self.window addSubview:helpView];
        //
        //        NSMutableArray *imageArr = [NSMutableArray array];
        //        for (int i = 0; i < 6; i ++) {
        //            [imageArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"instroduction%d.jpg",i]]];
        //        }
        //        [helpView setPerpage:imageArr];
        //        helpView.dismissBlock = ^ {
        //            [[NSNotificationCenter defaultCenter] postNotificationName:DZ_FirstLaunchApp_Notify object:nil];
        //        };
    } else {
        if (!self.isOpenUrl) {
            // 检查cookie是否过期
            
        }
        self.isOpenUrl = NO;
    }
}



@end
