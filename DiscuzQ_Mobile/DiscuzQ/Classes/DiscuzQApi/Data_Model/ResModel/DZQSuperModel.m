//
//  DZQSuperModel.m
//  DiscuzQ
//
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


@end

@implementation DZQSuperAttribute

@end


@implementation DZQSuperRelation

//+ (Class)relateClassForKey:(NSString *)typeKey{
//
//    return [[DZQNetTool shared].dataLogic.Maper modelClassForKey:typeKey];
//}

+ (instancetype)dz_modelWithDictionary:(NSDictionary *)dictionary{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (dictionary && dictionary.allKeys.count) {
        return [self relationModelWithDictionary:dictionary];
    }else{
        return nil;
    }
}

// 在 子类中做具体的类型转换
+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    return nil;
}

@end



