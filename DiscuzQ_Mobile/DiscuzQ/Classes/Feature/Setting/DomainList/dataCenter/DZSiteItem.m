//
//  DZSiteItem.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteItem.h"

@implementation DZSiteItem

- (instancetype)initWithName:(NSString *)name url:(NSString *)url desc:(NSString *)desc icon:(NSString *)icon
{
    self = [super init];
    if (self) {
        _siteName = name;
        _siteUrlString = url;
        _siteDescription = desc;
        _siteIcon = checkTwoStr(url, @"/favicon.ico");
    }
    return self;
}

+ (instancetype)siteName:(NSString *)name url:(NSString *)url desc:(NSString *)desc
{
    NSString *siteIcon = checkTwoStr(url, @"/favicon.ico");
    DZSiteItem *item = [[DZSiteItem alloc] initWithName:name url:url desc:desc icon:siteIcon];
    
    return item;
}

@end
