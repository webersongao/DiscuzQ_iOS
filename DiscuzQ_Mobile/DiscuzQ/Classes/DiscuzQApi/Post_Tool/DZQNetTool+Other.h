//
//  DZQNetTool+Other.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"


@interface DZQNetTool (Other)


/// 创建举报数据(主题 或 回复)
-(void)dz_threadOrPostReportWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;





@end


