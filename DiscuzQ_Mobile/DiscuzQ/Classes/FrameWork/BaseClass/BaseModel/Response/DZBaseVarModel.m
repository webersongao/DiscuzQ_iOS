//
//  DZBaseVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseVarModel.h"

@implementation DZBaseVarModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"notice" : [DZNoticeModel class]
    };
}


@end
