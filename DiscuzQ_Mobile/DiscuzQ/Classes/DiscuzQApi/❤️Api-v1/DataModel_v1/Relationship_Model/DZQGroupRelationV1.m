//
//  DZQGroupRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQGroupRelationV1.h"

@implementation DZQGroupRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"permission" : [DZQPermissionV1 class]};
}


@end
