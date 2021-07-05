//
//  DZQNetTool+Site_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQSiteV1.h"

@interface DZQNetTool (Site_V1)

//  前端获取配置接口 (GET)
-(void)DZQ_V1_SiteforumInfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

