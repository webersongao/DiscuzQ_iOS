//
//  DZQSiteSubV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSiteSubV3.h"


@implementation DZSiteManageV3

@end

@implementation DZSiteAuthorV3

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid":@"id"};
}

@end


@implementation DZSitePivotV3

@end

@implementation DZSiteGroupV3

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"groupId":@"id",@"isDefault":@"default"};
    
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"pivot" : [DZSitePivotV3 class]};
}

@end
