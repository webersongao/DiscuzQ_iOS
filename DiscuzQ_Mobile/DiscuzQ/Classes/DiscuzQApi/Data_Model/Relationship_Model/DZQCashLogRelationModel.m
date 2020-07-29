//
//  DZQCashLogRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCashLogRelationModel.h"

@implementation DZQCashLogRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataLoginUser class],
             @"order" : [DZQDataOrder class],
             @"userWalletCash" : [DZQDataOrder class],
             @"userWallet" : [DZQDataWallet class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQCashLogRelationModel *localModel = [DZQCashLogRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end
