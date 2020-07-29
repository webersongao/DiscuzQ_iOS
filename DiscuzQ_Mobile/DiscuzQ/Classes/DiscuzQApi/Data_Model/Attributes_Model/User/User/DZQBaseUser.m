//
//  DZQBaseUser.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseUser.h"

@implementation DZQBaseUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"user_id":@"id"};
}

@end

@implementation DZQDataUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQBaseUser class],@"relationships" : [DZQUserRelationModel class]};
}

@end

