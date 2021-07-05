//
//  DZQNetTool+Site_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQSiteV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Site_V3)

///  前端获取配置接口 (GET)
-(void)DZQ_V3_SiteforumInfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
