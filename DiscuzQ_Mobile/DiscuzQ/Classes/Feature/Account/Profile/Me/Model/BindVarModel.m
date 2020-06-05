//
//  BindVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "BindVarModel.h"

@implementation BindUser

-(void)setType:(NSString *)type{
    _type = type;
    if (type && [type isEqualToString:@"qq"]) {
        _icon = @"bound_qq";
        _name = @"QQ";
    } else {
        _icon = @"bound_wx";
        if ([type isEqualToString:@"minapp"]) {
            _name = @"小程序";
        } else {
            _name = @"微信";
        }
    }
}

@end



@implementation BindVarModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"users" : [BindUser class]};
}

@end
