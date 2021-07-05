//
//  DZNetFormatter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZNetFormatter : NSObject

@property(nonatomic,strong,readonly) dispatch_queue_t formartQueue;

/// 主线程
void formatterCenter_main_queue_task(void (^callback)(void));
/// 异步任务
void formatterCenter_async_task(void (^operationBlock)(void), void (^completionBlock)(void));


+ (instancetype)shared;
+(NSDictionary *)parameterType:(NSString *)type attributes:(NSDictionary *)attributes;

@end

NS_ASSUME_NONNULL_END
