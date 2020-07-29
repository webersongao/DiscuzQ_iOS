//
//  DZQThreadRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadRelationModel.h"


@implementation DZQThreadRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"posts" : [DZQDataPost class],
             @"topic" : [DZQDataTopic class],
             @"category" : [DZQDataCate class],
             @"paidUsers" : [DZQDataUser class],
             @"firstPost" : [DZQDataPost class],
             @"deletedUser" : [DZQDataUser class],
             @"threadVideo" : [DZQDataVideo class],
             @"rewardedUsers" : [DZQDataUser class],
             @"lastThreePosts" : [DZQDataPost class],
             @"lastPostedUser" : [DZQDataUser class]
    };
}





+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQThreadRelationModel *localModel = [DZQThreadRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}

@end
