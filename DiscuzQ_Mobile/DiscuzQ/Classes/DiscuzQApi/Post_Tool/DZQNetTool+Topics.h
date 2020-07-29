//
//  DZQNetTool+Topics.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Topics)


/// 获取话题列表
-(void)dz_TopicListOfThreadWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询话题接口[单条]
-(void)dz_TopicOneOfThreadWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
