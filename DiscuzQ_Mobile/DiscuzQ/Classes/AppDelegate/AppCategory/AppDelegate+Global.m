//
//  DZQDelegate+Global.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+Global.h"

@implementation DZQDelegate (Global)


-(void)Global_loadForumGlobalInfofromServer{
    
    [[DZNetCenter center] dzx_siteinfoWithUrlTag:0 completion:^(DZQForumModel *siteModel, BOOL bSuccess) {
        if (bSuccess) {
//            KSLog(@"WBS Siteinfo 成功啦");
        }else{
            KSLog(@"WBS Siteinfo 失败啦");
        }
    }];
}




@end
