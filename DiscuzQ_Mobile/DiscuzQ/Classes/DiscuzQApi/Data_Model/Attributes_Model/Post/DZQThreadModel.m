//
//  DZQThreadModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadModel.h"
#import "DZQThreadRelationModel.h"

@implementation DZQThreadModel


@end


@implementation DZQDataThread

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQThreadModel class]};
}

@end
