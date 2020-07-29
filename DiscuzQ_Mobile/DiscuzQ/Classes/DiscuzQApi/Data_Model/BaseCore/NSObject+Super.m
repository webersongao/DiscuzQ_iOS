//
//  NSObject+Super.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "NSObject+Super.h"


@implementation NSObject (Super)


+ (instancetype)dz_modelWithDictionary:(NSDictionary *)dictionary{
    
    return nil;
}

+ (instancetype)dz_innerWithDict:(NSDictionary *)dictionary{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (dictionary && dictionary.allKeys.count) {
        return [self yy_modelWithDictionary:dictionary];
    }else{
        return nil;
    }
}

@end
