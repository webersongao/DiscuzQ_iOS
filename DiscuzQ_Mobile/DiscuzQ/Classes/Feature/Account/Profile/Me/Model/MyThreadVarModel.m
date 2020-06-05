//
//  MyThreadVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "MyThreadVarModel.h"


@implementation ThreeadItemModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"src_new" : @"new",
             @"src_id" : @"id"};
}

@end

@implementation MyThreadVarModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [ThreeadItemModel class]};
}

@end
