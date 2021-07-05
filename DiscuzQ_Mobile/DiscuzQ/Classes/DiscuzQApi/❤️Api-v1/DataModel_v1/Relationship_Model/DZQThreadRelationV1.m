//
//  DZQThreadRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadRelationV1.h"


@implementation DZQThreadRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"posts" : [DZQDataPost class],
             @"topic" : [DZQDataTopic class],
             @"category" : [DZQDataCate class],
             @"question" : [DZQDataQesAnswer class],
             @"onlookers" : [DZQDataUser class],
             @"paidUsers" : [DZQDataUser class],
             @"firstPost" : [DZQDataPost class],
             @"deletedUser" : [DZQDataUser class],
             @"threadVideo" : [DZQDataVideo class],
             @"rewardedUsers" : [DZQDataUser class],
             @"lastThreePosts" : [DZQDataPost class],
             @"lastPostedUser" : [DZQDataUser class]
    };
}



@end
