//
//  DZQNetTool+Other_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"


@interface DZQNetTool (Other_V1)


/// 创建举报数据(主题 或 回复)
-(void)DZQ_V1_ReportThreadOrPost:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;





@end


