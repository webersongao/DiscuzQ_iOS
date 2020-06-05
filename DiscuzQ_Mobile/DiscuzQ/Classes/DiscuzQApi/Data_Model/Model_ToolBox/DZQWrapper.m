//
//  DZQWrapper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQWrapper.h"

@implementation DZQModelWrapper

- (instancetype)initWithModelClass:(Class)kClass
{
    if (self = [super init]) {
        _attCls  = kClass;
    }
    
    return self;
}

+ (instancetype)wrapperWithModelClass:(Class)kClass{
    return [[DZQModelWrapper alloc] initWithModelClass:kClass];
}

@end



@implementation DZQWrapper

- (instancetype)initWithClass:(Class)kClass convert:(DZQDataConvert *)convert
{
    if (self = [super init]) {
        _relateCls = kClass;
        _convert = convert;
    }
    
    return self;
}

+ (instancetype)wrapperWithClass:(Class)kClass convert:(DZQDataConvert *)convert
{
    return [[DZQWrapper alloc] initWithClass:kClass convert:convert];
}

@end


