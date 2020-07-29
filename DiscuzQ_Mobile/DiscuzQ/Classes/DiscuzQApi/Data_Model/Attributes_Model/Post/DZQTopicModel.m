//
//  DZQTopicModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTopicModel.h"

@implementation DZQTopicModel


@end




@implementation DZQDataTopic

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQTopicModel class],
             @"relationships" : [DZQTopicRelationModel class]
    };
}


@end
