//
//  DZQUserRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQUserRelationV1.h"

@implementation DZQUserRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"groups" : [DZQDataGroup class]};
}

@end
