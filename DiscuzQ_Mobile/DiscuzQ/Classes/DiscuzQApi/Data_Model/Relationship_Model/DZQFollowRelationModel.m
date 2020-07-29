//
//  DZQFollowRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQFollowRelationModel.h"

@implementation DZQFollowRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"toUser" : [DZQDataUser class],
             @"fromUser" : [DZQDataUser class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQFollowRelationModel *localModel = [DZQFollowRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end
