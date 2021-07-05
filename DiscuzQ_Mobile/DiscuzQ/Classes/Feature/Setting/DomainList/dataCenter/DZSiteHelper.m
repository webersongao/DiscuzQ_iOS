//
//  DZSiteHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteHelper.h"

#define KRoot_Domainkey     @"DZClient_Root_Domain"

NSString * const KDomainListKey = @"domainLisKey";
NSString * const KLocalDomainList = @"local_DomainList";

@implementation DZSiteHelper

+ (instancetype)shared {
    static DZSiteHelper *upTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upTool = [[DZSiteHelper alloc] init];
    });
    return upTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _siteUrlString = [self getRootUrlDomain];
    }
    return self;
}


+(NSArray<DZSiteItem *> *)localSiteDataArray{
 
    NSArray *localArray = [DZSiteHelper readSiteDataFromLocal];
    if (!localArray.count) {
        localArray = [DZSiteHelper defaultSiteArray];
        [DZSiteHelper saveToLocalSiteDataArray:localArray];
    }
    
    return localArray;
}


+(NSArray <DZSiteItem *>*)defaultSiteArray{
    
    DZSiteItem *item01 = [DZSiteItem siteName:@"DiscuzQ官方站" url:@"https://discuz.chat" desc:@"Discuz! Q官方支持论坛"];
    DZSiteItem *item02 = [DZSiteItem siteName:@"生存社" url:@"https://www.bcman.cn" desc:@"BushCraft野营交流社区"];
    DZSiteItem *item03 = [DZSiteItem siteName:@"斗茶网" url:@"http://m.doucha.com" desc:@"从来名士能评水 自古高僧爱斗茶"];
    DZSiteItem *item04 = [DZSiteItem siteName:@"自考生社区" url:@"https://club.zikaoda.com" desc:@"自考大网校—陪你走不甘平庸的路"];
    DZSiteItem *item05 = [DZSiteItem siteName:@"卢仝茶学社" url:@"http://chaxueshe.net" desc:@"以茶师为中心,为广大茶师和茶人服务de交流平台"];
    DZSiteItem *item06 = [DZSiteItem siteName:@"机车邦" url:@"https://www.jiche.org" desc:@"城邦其实走四方,一个发现与探索的机车世界"];
    
//    DZSiteItem *item06 = [DZSiteItem siteName:@"贴片圈" url:@"https://tiepianquan.com" desc:@""];
    
    return @[item01,item02,item03,item04,item05,item06];
}


+(NSArray<DZSiteItem *> *)readSiteDataFromLocal{
    
    NSArray *dicArr = [[DZFileManager Shared] read_ClinetDocument:KDomainListKey];
    NSMutableArray *itemArray = [NSMutableArray array];
    for (NSDictionary *innerDict in dicArr) {
        DZSiteItem *innerItem = [DZSiteItem DZQ_ModelWithDictionary:innerDict];
        if (innerItem) {[itemArray addObject:innerItem];}
    }
    
    return itemArray;
}


+(void)saveToLocalSiteDataArray:(NSArray <DZSiteItem *>*)dataArray{
   
    NSMutableArray *localArray = [NSMutableArray array];
    for (DZSiteItem *item in dataArray) {
        NSDictionary *itemDict = [item DZQ_ModelToDictionary];
        if (itemDict) {
            [localArray addObject:itemDict];
        }
    }
    
    [[DZFileManager Shared] write_ClientDocument:@{KDomainListKey:localArray} fileName:KDomainListKey];
}


-(NSString *)getRootUrlDomain{
    NSString *homeUrl = [[NSUserDefaults standardUserDefaults] objectForKey:KRoot_Domainkey];
    return ([homeUrl isUrlContainDomain] && [homeUrl isSiteHomeUrl]) ? homeUrl : DZQ_DefaultURL;
}

-(BOOL)updateLocalUrlDomain:(NSString *)urlDomain{
    urlDomain = urlDomain.length ? urlDomain : DZQ_DefaultURL;
    if ([urlDomain isSiteHomeUrl]) {
        _siteUrlString = urlDomain;
        [[NSUserDefaults standardUserDefaults] setObject:urlDomain forKey:KRoot_Domainkey];
        return [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return NO;
}



@end
