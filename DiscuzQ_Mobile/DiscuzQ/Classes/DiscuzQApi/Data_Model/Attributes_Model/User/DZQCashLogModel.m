//
//  DZQCashLogModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCashLogModel.h"


@implementation DZQCashLogModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"log_id":@"id"};
}

@end


@implementation DZQDataCashLog

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCashLogModel class],
             @"relationships" : [DZQCashLogRelationModel class]
    };
}


@end
