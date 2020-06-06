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

/// 获取 分类列表
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZQDataCate *> *varModel, BOOL success))completion;

/// 获取 分类下主题列表
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion;

/// 获取 单一主题详细信息
-(void)dzx_threadOneWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(DZQDataThread *threadData,BOOL success))completion;
 
/// 查询 回复 接口[列表]
-(void)dzx_PostListWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion;
 

/// 获取 单一主题详细信息(复合型接口，支持上拉刷新更多)
-(void)dzx_threadOneDeatilWithThreadId:(NSString *)thread_id postPage:(NSInteger)page completion:(void (^)(DZQDataThread *threadData,BOOL hasMore))completion;

@end

NS_ASSUME_NONNULL_END
