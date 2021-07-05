//
//  DZInstance.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZInstance.h"
#import "DZCacheHelper+UserPath.h"

@implementation DZInstance

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config_localInstance];
    }
    return self;
}


-(void)config_localInstance{
    _dateFormatter = [[NSDateFormatter alloc] init];
    
    NSArray *localCateArr = [[DZFileManager Shared] readDocumentPlist:[DZCacheHelper Shared].fileName_ThreadCategory];
    NSDictionary *localSite = [[DZFileManager Shared] readDocumentPlist:[DZCacheHelper Shared].fileName_SiteConfigInfo].firstObject;
    _cateModelArray = [DZThreadCateM DZQ_DictionaryArrayToModel:localCateArr];
    
    _siteModel = localSite ? [DZQSiteV1 DZQ_ModelWithDictionary:localSite] : nil;
}




-(void)saveSiteModel:(DZQSiteV1 *)siteModel{
    _siteModel = siteModel;
    NSDictionary *siteDict = [siteModel DZQ_ModelToDictionary];
    [[DZFileManager Shared] writeDocumentPlist:siteDict fileName:[DZCacheHelper Shared].fileName_SiteConfigInfo];
}

-(void)saveThreadCateArray:(NSArray<DZThreadCateM *> *)cateArray{
    _cateModelArray = cateArray;
    NSArray *cateArr = [cateArray DZQ_ModelToDictionaryArray];
    [[DZFileManager Shared] writeDocumentPlist:cateArr fileName:[DZCacheHelper Shared].fileName_ThreadCategory];
    
}













@end
