//
//  DZQFollowModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQFollowModel.h"

@implementation DZQFollowModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"follow_id":@"id"};
}

@end



@implementation DZQDataFollow

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQFollowModel class],
             @"relationships" : [DZQFollowRelationModel class]
    };
}



@end
