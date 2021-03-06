//
//  DZCacheHelper+UserPath.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZCacheHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZCacheHelper (UserPath)


// 路径
- (NSString *)Path_searchHistory;



// 文件名

// 主题 分类信息
- (NSString *)fileName_ThreadCategory;

// 站点 配置信息
- (NSString *)fileName_SiteConfigInfo;

@end

NS_ASSUME_NONNULL_END
