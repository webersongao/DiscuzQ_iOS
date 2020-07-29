//
//  DZQNetTool+Site.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQForumModel.h"

@interface DZQNetTool (Site)

//  前端获取配置接口 (GET)
-(void)dz_siteinfoWithUrlTag:(NSInteger)urlTag success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

