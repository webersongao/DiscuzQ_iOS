//
//  DZQCashModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCashModel.h"

@implementation DZQCashModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"cash_id":@"id"};
}

@end


@implementation DZQDataCash

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCashModel class],@"relationships" : [DZQCashRelationModel class]};
}


@end
