//
//  DZNetCenter+Site.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Site.h"

@implementation DZNetCenter (Site)

//// 获取站点基本信息
-(void)dzx_siteinfoWithUrlTag:(NSInteger)urlTag completion:(void (^)(DZQForumModel *siteModel, BOOL success))completion{
   
    [[DZQNetTool shared] dz_siteinfoWithUrlTag:1125 success:^(DZQResModel * data, BOOL success) {
        if (completion) {
            DZQForumModel *siteModel = (DZQForumModel *)data.dataBody.firstObject.attributes;
            completion(siteModel,success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


//// 站点搜索（主题 + 用户）
-(void)dzx_siteSearcWithKey:(NSString *)keyStr page:(NSInteger)page completion:(void (^)(id varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_userSearcWithName:keyStr page:page success:^(id data, BOOL success) {
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
}

@end
