//
//  DZQPermissionModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQPermissionModel.h"

@implementation DZQPermissionModel

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"per_id":@"id"};
//}

@end



@implementation DZQDataPermission

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQPermissionModel class]};
}


@end;
