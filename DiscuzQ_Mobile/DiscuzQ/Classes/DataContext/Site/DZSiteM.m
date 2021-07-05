//
//  DZSiteM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteM.h"
#import "DataBaseHeader.h"

@implementation DZSiteSetM

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"siteManage" : [DZSiteManageM class],
             @"siteAuthor" : [DZSiteAuthorM class]};
}

@end

@implementation DZSiteRegM

@end


@implementation DZSitePassM

@end

@implementation DZSitePayM

@end

@implementation DZSiteAttachM

@end

@implementation DZSiteQCloudM

@end

@implementation DZSiteCashM

@end

@implementation DZSiteOtherM

@end

@implementation DZSiteLbsM

@end

@implementation DZSiteUCenterM

@end

@implementation DZSiteAgreeM

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"isRegister":@"register"};
}

@end


@implementation DZSiteM

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"setSite" : [DZSiteSetM class],
             @"setReg" : [DZSiteRegM class],
             @"passport" : [DZSitePassM class],
             @"paycenter" : [DZSitePayM class],
             @"setAttach" : [DZSiteAttachM class],
             @"qcloud" : [DZSiteQCloudM class],
             @"setCash" : [DZSiteCashM class],
             @"other" : [DZSiteOtherM class],
             @"lbs" : [DZSiteLbsM class],
             @"ucenter" : [DZSiteUCenterM class],
             @"agreement" : [DZSiteAgreeM class]
    };
}

@end
