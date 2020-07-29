//
//  DZBaseAuthModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/6.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseAuthModel.h"

@implementation DZBaseAuthModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"threadtypes" : [DZThreadTypesModel class],
             @"allowperm" : [DZThreadPermModel class],
             @"forum" : [ForumModel class],
             @"activity_setting" : [DZActivitySetModel class]
    };
}

@end
