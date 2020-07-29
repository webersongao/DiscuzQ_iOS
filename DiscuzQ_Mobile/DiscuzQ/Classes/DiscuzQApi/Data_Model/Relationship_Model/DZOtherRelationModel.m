//
//  DZOtherRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZOtherRelationModel.h"

@implementation DZQLoginRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"users" : [DZQDataLoginUser class]};
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQLoginRelationModel *localModel = [DZQLoginRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end

@implementation DZQWalletRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class]};
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQWalletRelationModel *localModel = [DZQWalletRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end


@implementation DZQCashRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"userWallet" : [DZQDataCash class]};
}


+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQCashRelationModel *localModel = [DZQCashRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end



