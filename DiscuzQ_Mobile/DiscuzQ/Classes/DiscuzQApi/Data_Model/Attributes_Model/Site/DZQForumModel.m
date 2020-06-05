//
//  DZQForumModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQForumModel.h"

@implementation DZSite_setModel

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




@implementation DZQForumModel

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
