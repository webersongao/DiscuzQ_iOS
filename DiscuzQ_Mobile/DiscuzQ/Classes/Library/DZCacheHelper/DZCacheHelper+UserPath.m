//
//  DZCacheHelper+UserPath.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZCacheHelper+UserPath.h"

@implementation DZCacheHelper (UserPath)

// 路径
- (NSString *)Path_searchHistory{
    return [[DZFileManager Shared].dz_CachesPath stringByAppendingPathComponent:@"DZQ_SearchHistories.plist"];
}

// 文件名

// 主题 分类信息
- (NSString *)fileName_ThreadCategory{
    return @"DZQ_ThreadCategory";
}

// 站点 配置信息
- (NSString *)fileName_SiteConfigInfo{
    return @"DZQ_SiteInfo";
}


@end
