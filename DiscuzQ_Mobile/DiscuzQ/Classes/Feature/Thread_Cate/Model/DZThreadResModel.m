//
//  DZThreadResModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadResModel.h"

@implementation DZThreadResModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Variables" : [DZThreadVarModel class]
    };
}


@end
