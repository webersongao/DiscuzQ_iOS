//
//  DZQFollowRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQFollowRelationV1.h"

@implementation DZQFollowRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"toUser" : [DZQDataUser class],
             @"fromUser" : [DZQDataUser class]
    };
}

@end
