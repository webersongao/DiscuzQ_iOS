//
//  LocalStringUtil.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/2/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "LocalStringUtil.h"

@implementation LocalStringUtil

+ (NSString *)localString:(NSString *)string
{
//   return [[NSBundle mainBundle] localizedStringForKey:string value:string table:@"Localizable"]
    return string;
}
@end
