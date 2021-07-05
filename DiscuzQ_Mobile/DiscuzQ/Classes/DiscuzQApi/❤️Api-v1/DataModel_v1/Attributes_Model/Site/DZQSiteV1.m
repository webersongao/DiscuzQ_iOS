//
//  DZQSiteV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSiteV1.h"

@implementation DZSite_setModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"site_manage" : [DZSite_manage class],
             @"site_author" : [DZSite_author class]};
}

@end

@implementation DZSite_regModel

@end


@implementation DZSite_passModel

@end

@implementation DZSite_payModel

@end

@implementation DZSite_attachModel

@end

@implementation DZSite_qcloudModel

@end

@implementation DZSite_cashModel

@end

@implementation DZSite_otherModel

@end

@implementation DZSite_lbsModel

@end

@implementation DZSite_ucenterModel

@end

@implementation DZSite_signModel

@end

@implementation DZSite_userModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"groups" : [DZSite_group class]};
}

@end


@implementation DZQSiteV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"set_site" : [DZSite_setModel class],
             @"set_reg" : [DZSite_regModel class],
             @"passport" : [DZSite_passModel class],
             @"paycenter" : [DZSite_payModel class],
             @"set_attach" : [DZSite_attachModel class],
             @"qcloud" : [DZSite_qcloudModel class],
             @"set_cash" : [DZSite_cashModel class],
             @"other" : [DZSite_otherModel class]
    };
}




@end
