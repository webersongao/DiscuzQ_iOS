//
//  DZQCashLogRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCashLogRelationV1.h"

@implementation DZQCashLogRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataLoginUser class],
             @"order" : [DZQDataOrder class],
             @"userWalletCash" : [DZQDataOrder class],
             @"userWallet" : [DZQDataWallet class]
    };
}

@end
