//
//  PrivacyModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "PrivacyModel.h"

@implementation UserFeedModel

@end

@implementation UserViewModel

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"friendNum" : @"friend",
    };
}

@end


@implementation DZProfileModel


@end



@implementation PrivacyModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"feed" : [UserFeedModel class],
             @"view" : [UserViewModel class],
             @"profile" : [DZProfileModel class]
    };
}

@end


