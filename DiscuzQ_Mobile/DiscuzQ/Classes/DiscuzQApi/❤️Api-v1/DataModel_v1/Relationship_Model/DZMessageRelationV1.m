//
//  DZMessageRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMessageRelationV1.h"

@implementation DZMessageRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sender" : [DZQDataUser class],
             @"recipient" : [DZQDataUser class]
    };
}

@end
