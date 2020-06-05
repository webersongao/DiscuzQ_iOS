//
//  DZNetCenter+Post.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (Post)

/// 获取 内容分类
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZQDataCate *> *varModel, BOOL success))completion;

/// 获取 主题分类列表
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

// 获取主题详细信息
-(void)dzx_threadOneWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(DZQDataThread *threadData,BOOL success))completion;
 

 
 
 

@end

NS_ASSUME_NONNULL_END
