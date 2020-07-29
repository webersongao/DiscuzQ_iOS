//
//  DZQOrderModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQOrderModel.h"

@implementation DZQOrderModel


@end


@implementation DZQDataOrder

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQOrderModel class],
             @"relationships" : [DZQOrderRelationModel class]
    };
}

@end
