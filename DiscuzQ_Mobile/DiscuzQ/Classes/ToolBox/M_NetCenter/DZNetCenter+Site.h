//
//  DZNetCenter+Site.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Site)

//// 获取站点基本信息
-(void)dzx_siteinfoWithUrlTag:(NSInteger)urlTag completion:(void (^)(DZQForumModel *siteModel, BOOL success))completion;


//// 站点搜索（主题 + 用户）
-(void)dzx_siteSearcWithKey:(NSString *)keyStr page:(NSInteger)page completion:(void (^)(id varModel, BOOL success))completion;

@end

NS_ASSUME_NONNULL_END
