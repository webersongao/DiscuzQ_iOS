//
//  DZSiteSubM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteSubM.h"

@implementation DZSiteManageM

@end

@implementation DZSiteAuthorM

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid":@"id"};
}

@end


@implementation DZSitePivotM

@end

@implementation DZSiteGroupM

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"groupId":@"id",@"isDefault":@"default"};
    
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"pivot" : [DZSitePivotM class]};
}

@end
