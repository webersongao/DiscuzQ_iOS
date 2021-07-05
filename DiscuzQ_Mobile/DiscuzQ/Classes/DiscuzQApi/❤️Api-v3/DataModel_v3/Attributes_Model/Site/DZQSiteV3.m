//
//  DZQSiteV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSiteV3.h"

@implementation DZSiteSetV3

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"siteManage" : [DZSiteManageV3 class],
             @"siteAuthor" : [DZSiteAuthorV3 class]};
}

@end

@implementation DZSiteRegV3

@end


@implementation DZSitePassV3

@end

@implementation DZSitePayV3

@end

@implementation DZSiteAttachV3

@end

@implementation DZSiteQCloudV3

@end

@implementation DZSiteCashV3

@end

@implementation DZSiteOtherV3

@end

@implementation DZSiteLbsV3

@end

@implementation DZSiteUCenterV3

@end

@implementation DZSiteAgreeV3

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"isRegister":@"register"};
}

@end


@implementation DZQSiteV3

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"setSite" : [DZSiteSetV3 class],
             @"setReg" : [DZSiteRegV3 class],
             @"passport" : [DZSitePassV3 class],
             @"paycenter" : [DZSitePayV3 class],
             @"setAttach" : [DZSiteAttachV3 class],
             @"qcloud" : [DZSiteQCloudV3 class],
             @"setCash" : [DZSiteCashV3 class],
             @"other" : [DZSiteOtherV3 class],
             @"lbs" : [DZSiteLbsV3 class],
             @"ucenter" : [DZSiteUCenterV3 class],
             @"agreement" : [DZSiteAgreeV3 class]
    };
}

@end
