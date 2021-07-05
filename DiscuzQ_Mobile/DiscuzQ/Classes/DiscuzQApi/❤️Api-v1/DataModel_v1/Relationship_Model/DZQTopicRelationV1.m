//
//  DZQTopicRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTopicRelationV1.h"

@implementation DZQTopicRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"lastThread" : [DZQDataThread class]
    };
}


@end
