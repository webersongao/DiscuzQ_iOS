//
//  DZQQesAnswerRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQQesAnswerRelationV1.h"

@implementation DZQQesAnswerRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"beUser" : [DZQDataUser class],
             @"images" : [DZQDataAttachment class]
    };
}

@end
