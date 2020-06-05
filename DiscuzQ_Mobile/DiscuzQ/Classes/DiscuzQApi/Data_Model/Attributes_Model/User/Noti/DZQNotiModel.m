//
//  DZQNotiModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNotiModel.h"

@implementation DZQNotiModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"noti_id":@"id"};
}

@end

@implementation DZQDataNoti

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQNotiModel class]};
}

@end


