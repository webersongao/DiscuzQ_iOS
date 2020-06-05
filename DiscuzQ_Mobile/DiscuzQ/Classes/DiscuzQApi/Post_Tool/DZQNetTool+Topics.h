//
//  DZQNetTool+Topics.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQVideoModel.h"

@interface DZQNetTool (Topics)

/// 获取 分类帖子列表
-(void)dz_threadListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询主题接口[单条]
-(void)dz_threadOneWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


