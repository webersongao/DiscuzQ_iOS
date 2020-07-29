//
//  DZAttachModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZAttachModel.h"

@implementation DZAttachModel

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"attch_desc" : @"description",
    };
}

@end
