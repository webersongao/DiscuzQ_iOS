//
//  DZQSuperModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@implementation DZQStyle

+(DZQStyle *)inner_dataStyle:(DZQSuperData *)dataModel{
 
    return nil;
}

@end

@implementation DZQSuperData

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    return self;
}

@end

@implementation DZQSuperAttribute

@end


@implementation DZQSuperRelation

+ (instancetype)super_modelWithDictionary:(NSDictionary *)dictionary{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (dictionary && dictionary.allKeys.count) {
        id targetModel = [self relationModelWithDictionary:dictionary];
        if (targetModel) {
            return targetModel;
        }else{
            return [[self class] DZQ_ModelWithDictionary:dictionary];
        }
    }else{
        return nil;
    }
}

// 在 子类中做具体的类型转换
+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    return nil;
}

@end


@implementation DZQSuperModel

@end
