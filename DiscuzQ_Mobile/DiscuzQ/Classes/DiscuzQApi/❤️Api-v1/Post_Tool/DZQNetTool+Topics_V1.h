//
//  DZQNetTool+Topics_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQTopicV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Topics_V1)


/// 获取话题列表
-(void)DZQ_V1_TopicListOfThreadWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询话题接口[单条]
-(void)DZQ_V1_TopicOneOfThreadWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
