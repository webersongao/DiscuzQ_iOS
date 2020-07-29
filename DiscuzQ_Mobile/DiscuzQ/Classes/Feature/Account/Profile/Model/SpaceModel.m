//
//  SpaceModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "SpaceModel.h"

@implementation SpaceModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"group" : [UserGroupModel class],
             @"privacy" : [PrivacyModel class],
             @"admingroup" : [AdmingroupModel class]
    };
}

@end
