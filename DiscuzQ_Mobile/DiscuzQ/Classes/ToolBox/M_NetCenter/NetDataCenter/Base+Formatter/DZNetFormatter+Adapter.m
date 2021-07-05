//
//  DZNetFormatter+Adapter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetFormatter+Adapter.h"
#import "DZQNetApi_V1.h"
#import "DZQNetApi_V3.h"

@implementation DZNetFormatter (Adapter)

-(NSArray<DZThreadCateM *> *)category_ConvertWithObj:(NSArray<id> *)objectArr{
    
    //    NSMutableArray<DZThreadCateM *> *MuArray = [NSMutableArray array];
    //    for (id innerObj in objectArr) {
    //        if ([innerObj isKindOfClass:[DZQDataCate class]]) {
    //
    //            DZQCateV1 *cateV1Obj = ((DZQDataCate *)innerObj).attributes;
    //            DZThreadCateM *CateModel = [DZThreadCateM new];
    //            CateModel.pid = cateV1Obj.inner_id;
    //            CateModel.name = cateV1Obj.name;
    //            CateModel.icon = cateV1Obj.icon;
    //            CateModel.categorydesc = cateV1Obj.cate_description;
    //            CateModel.sort = cateV1Obj.sort;
    //            CateModel.property = cateV1Obj.property;
    //            CateModel.threadCount = cateV1Obj.thread_count;
    //            CateModel.parentid = checkInteger(cateV1Obj.parentid);
    //            CateModel.canCreateThread = cateV1Obj.canCreateThread;
    ////            CateModel.childSearchIds = cateV1Obj.search_ids;
    //
    //            [MuArray addObject:CateModel];
    //        }else if ([innerObj isKindOfClass:[DZQCateV3 class]]){
    //            DZQCateV3 *cateV3Obj = (DZQCateV3 *)innerObj;
    //            DZThreadCateM *CateModel = [DZThreadCateM new];
    //
    //            CateModel.pid = cateV3Obj.pid;
    //            CateModel.name = cateV3Obj.name;
    //            CateModel.icon = cateV3Obj.icon;
    //            CateModel.categorydesc = cateV3Obj.cate_description;
    //            CateModel.sort = cateV3Obj.sort;
    //            CateModel.property = cateV3Obj.property;
    //            CateModel.threadCount = cateV3Obj.threadCount;
    //            CateModel.parentid = cateV3Obj.parentid;
    //            CateModel.canCreateThread = cateV3Obj.canCreateThread;
    //            CateModel.childSearchIds = cateV3Obj.searchIds;
    ////            CateModel.childCategorys = cateV3Obj.children;
    //
    //            [MuArray addObject:CateModel];
    //        }
    //    }
    //
    //    return MuArray.copy;
    
    NSMutableArray *oriModelArray = [NSMutableArray array];
    for (id innerObj in objectArr) {
        if ([innerObj isKindOfClass:[DZQDataCate class]]) {
            DZQCateV1 *cateV1Obj = ((DZQDataCate *)innerObj).attributes;
            if (cateV1Obj) {
                [oriModelArray addObject:cateV1Obj];
            }
        }else{
            oriModelArray = [NSMutableArray arrayWithArray:objectArr];
        }
    }
    
    NSArray<NSDictionary *> *siteDict = [oriModelArray DZQ_ModelToDictionaryArray];
    NSArray *MuArray = [NSArray DZQ_ModelArrayWithClass:[DZThreadCateM class] json:siteDict];
    
    return MuArray;
}


-(DZSiteM *)forum_ConvertWithObj:(id)object{
    
    DZSiteM *siteM = nil;
    if ([object isKindOfClass:[DZQSiteV1 class]]) {
        NSLog(@"WBS ");
    }else if ([object isKindOfClass:[DZQSiteV3 class]]){
        NSDictionary *siteDict = [object DZQ_ModelToDictionary];
        siteM = [DZSiteM DZQ_ModelWithDictionary:siteDict];
    }
    
    return siteM;
}


-(NSArray<DZUserM *> *)user_ConvertWithObj:(id)object{
    
    DZUserM *userM = nil;
    if ([object isKindOfClass:[DZQUserV1 class]]) {
        
    }else if ([object isKindOfClass:[DZQUserV3 class]]){
        
    }
    return userM ? @[userM] : nil;
}



-(NSArray<DZThreadDraftM *> *)draft_ConvertWithObj:(NSArray<id> *)object{
    
    return nil;
}




-(NSArray<DZThreadM *> *)thread_ConvertWithObj:(id)object{
    
    return nil;
}



-(NSArray<DZDialogM *> *)dialog_ConvertWithObj:(NSArray<id> *)object{
    
    return nil;
}


-(NSArray<DZMessageM *> *)message_ConvertWithObj:(NSArray<id> *)object{
    
    return nil;
}


-(NSArray<DZNotificationM *> *)notification_ConvertWithObj:(NSArray<id> *)object{
    
    return nil;
}





@end
