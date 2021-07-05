//
//  DZQGratuityRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQGratuityRelationV1.h"

@implementation DZQGratuityRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"beUser" : [DZQDataUser class],
             @"images" : [DZQDataAttachment class]
    };
}


@end
