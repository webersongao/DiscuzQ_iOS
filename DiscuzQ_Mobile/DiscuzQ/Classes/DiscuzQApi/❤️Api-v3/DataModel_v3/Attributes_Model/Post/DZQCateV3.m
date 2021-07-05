//
//  DZQCateV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCateV3.h"

@implementation DZQCateV3

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"cate_description":@"description"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"children" : [DZQCateV3 class]};
}

@end
