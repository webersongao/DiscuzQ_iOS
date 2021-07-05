//
//  DZGlobalHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZGlobalHelper.h"
#import "DZDataContext+Site.h"
#import "DZDataContext+Thread.h"
#import "DZDataContext+Category.h"


static DZGlobalHelper *infoHepler;

@implementation DZGlobalHelper


+ (DZGlobalHelper *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        infoHepler = [[DZGlobalHelper alloc] init];
    });
    return infoHepler;
}

-(void)Global_RequestForumGlobalConfigfromServer{
    
    // 请求站点配置信息
    [self Global_Request_SiteInfoFromServer];
}

-(void)Global_Request_SiteInfoFromServer{
    
    [[DZNetCenter center] dzx_siteforumInfoWithCompletion:^(DZSiteM *siteModel, BOOL bSuccess) {
        if (bSuccess) {
//            [[DZMobileCtrl sharedCtrl].instance saveSiteModel:siteModel];
        }else{
            KSLog(@"WBS Siteinfo 失败啦");
        }
        [self Global_Request_CategoryListFromServer];
    }];
}

-(void)Global_Request_CategoryListFromServer{
    
    [[DZNetCenter center] dzx_categoryListWithCompletion:^(NSArray<DZThreadCateM *> *varModel, BOOL success) {
        if (success) {
            [[DZMobileCtrl sharedCtrl].instance saveThreadCateArray:varModel];
        }else{
            [DZMobileCtrl showAlertError:@"数据获取错误"];
        }
        [self Global_Request_otherSiteFromServer];
    }];
    
}


-(void)Global_Request_otherSiteFromServer{
    
    
}





@end
