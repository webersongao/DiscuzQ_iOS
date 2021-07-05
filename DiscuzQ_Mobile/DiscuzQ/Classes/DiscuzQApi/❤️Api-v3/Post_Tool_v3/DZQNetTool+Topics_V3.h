//
//  DZQNetTool+Topics_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Topics_V3)


/// 获取话题列表
-(void)DZQ_V3_TopicListOfThreadWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询话题接口[单条]
-(void)DZQ_V3_TopicOneOfThreadWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
