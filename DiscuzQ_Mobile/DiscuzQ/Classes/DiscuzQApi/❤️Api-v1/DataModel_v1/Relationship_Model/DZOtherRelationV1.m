//
//  DZOtherRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZOtherRelationV1.h"

@implementation DZQLoginRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"users" : [DZQDataLoginUser class]};
}


@end

@implementation DZQWalletRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class]};
}

@end


@implementation DZQCashRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"userWallet" : [DZQDataCash class]};
}


@end



