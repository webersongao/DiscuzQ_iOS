//
//  DZQUserModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQUserModel.h"

@implementation DZQUnReadModel


@end

@implementation DZQUserModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"typeUnreadNotifications" : [DZQUnReadModel class]};
}

@end

@implementation DZQDataLoginUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQUserModel class]};
}

@end
