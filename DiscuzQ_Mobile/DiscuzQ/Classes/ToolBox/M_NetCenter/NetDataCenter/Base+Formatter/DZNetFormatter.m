//
//  DZNetFormatter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetFormatter.h"

@interface DZNetFormatter ()

@property (nonatomic, strong) NSOperationQueue *shelfQueue;

@end

static DZNetFormatter *formatter = nil;
@implementation DZNetFormatter

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[DZNetFormatter alloc] init];
    });
    return formatter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shelfQueue = [[NSOperationQueue alloc] init];
        _shelfQueue.maxConcurrentOperationCount = 1; // 最大并发为一个
        _formartQueue = dispatch_queue_create([[NSString stringWithFormat:@"iOS_NetCenter_Formarter_Queue.%p", self] UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

// 主线程
void formatterCenter_main_queue_task(void (^callback)(void))
{
    if (!callback) {
        return ;
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        callback();
    }];
}

// 异步
void formatterCenter_async_task(void (^operationBlock)(void), void (^completionBlock)(void))
{
    if (!operationBlock) {
        return;
    }
    [formatter.shelfQueue addOperationWithBlock:^{
        operationBlock();
        formatterCenter_main_queue_task(completionBlock);
    }];
}

+(NSDictionary *)parameterType:(NSString *)type attributes:(NSDictionary *)attributes{
    
    if (!type.length || !attributes.allKeys.count) {
        return nil;
    }
    
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    [dataDict setValue:type forKey:@"data"];
    [dataDict setValue:attributes forKey:@"attributes"];
    
    return @{@"data" : dataDict};
}



@end
