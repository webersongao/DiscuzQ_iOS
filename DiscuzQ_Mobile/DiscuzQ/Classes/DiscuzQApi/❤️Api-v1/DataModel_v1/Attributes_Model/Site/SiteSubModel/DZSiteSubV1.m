//
//  DZSiteSubV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteSubV1.h"

@implementation DZSite_manage

@end

@implementation DZSite_author

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid":@"id"};
}

@end


@implementation DZSite_pivot

@end

@implementation DZSite_group

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"groupId":@"id",@"isDefault":@"default"};
    
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"pivot" : [DZSite_pivot class]};
}

@end
