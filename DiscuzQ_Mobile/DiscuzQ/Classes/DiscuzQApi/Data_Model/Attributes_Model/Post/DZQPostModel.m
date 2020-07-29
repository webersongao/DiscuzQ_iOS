//
//  DZQPostModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQPostModel.h"

@implementation DZQPostModel


@end




@implementation DZQDataPost

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQPostModel class],
             @"relationships" : [DZQPostRelationModel class]
    };
}


@end
