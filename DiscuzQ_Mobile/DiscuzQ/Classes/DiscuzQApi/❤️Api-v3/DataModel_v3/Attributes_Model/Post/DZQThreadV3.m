//
//  DZQThreadV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadV3.h"

@implementation DZQThreadV3


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQBaseUserV3 class],
             @"group" : [DZQBaseUserV3 class],
             @"likeReward" : [DZQBaseUserV3 class],
             @"displayTag" : [DZQBaseUserV3 class],
             @"position" : [DZQBaseUserV3 class],
             @"ability" : [DZQBaseUserV3 class],
             @"content" : [DZQBaseUserV3 class]
    };
}


@end
