//
//  DZQMessageModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMessageModel.h"

@implementation DZQMessageModel


@end


@implementation DZQDataMessage

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQMessageModel class],
             @"relationships" : [DZMessageRelationModel class]
    };
}



@end
