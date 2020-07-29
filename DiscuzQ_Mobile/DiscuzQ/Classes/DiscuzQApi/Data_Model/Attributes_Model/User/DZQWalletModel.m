//
//  DZQWalletModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQWalletModel.h"

@implementation DZQWalletModel


@end


@implementation DZQDataWallet

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCateModel class],
             @"relationships" : [DZQWalletRelationModel class]
    };
}

@end
