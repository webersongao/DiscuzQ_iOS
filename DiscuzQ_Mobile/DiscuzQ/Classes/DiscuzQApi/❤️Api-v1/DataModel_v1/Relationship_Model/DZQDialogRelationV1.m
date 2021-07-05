//
//  DZQDialogRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDialogRelationV1.h"

@implementation DZQDialogRelationV1


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sender" : [DZQDataUser class],
             @"recipient" : [DZQDataUser class],
             @"dialogMessage" : [DZQDataMessage class]
    };
}




@end
