//
//  DZThreadNetTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadNetTool.h"
#import "DiscoverModel.h"

@implementation DZThreadNetTool

/// 板块下级，帖子列表
+ (void)DZ_DownloadForumListWithType:(DZRLoadType)loadType fid:(NSString *)fid page:(NSInteger)page listType:(DZ_ListType)listType completion:(void(^)(DZThreadResModel *threadResModel,BOOL isCache,NSError *error))completion{
    
    NSString *fourmId = checkNull(fid);
    if (!fourmId.length) {
        KSLog(@"傻逼呀你，没有fid怎么拉取数据");
        return;
    }
    NSDictionary *tmpDic = @{@"fid":[NSString stringWithFormat:@"%@",fourmId],
                             @"page":[NSString stringWithFormat:@"%ld",(long)page]};
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:tmpDic];
    
    if (listType == DZ_ListAll) {
        KSLog(@"如果你看到这段代码，请告诉她。。。。。。。。特么的出bug啦");
    }else if (listType == DZ_ListNew) {
        //        [dic setValue:@"lastpost" forKey:@"filter"];
        //        [dic setValue:@"lastpost" forKey:@"orderby"];
        [dict setValue:@"author" forKey:@"filter"];
        [dict setValue:@"dateline" forKey:@"orderby"];
    } else if (listType == DZ_ListHot) {
        [dict setValue:@"heat" forKey:@"filter"];
        [dict setValue:@"heats" forKey:@"orderby"];
    } else if (listType == DZ_ListBest) {
        [dict setValue:@"digest" forKey:@"filter"];
        [dict setValue:@"1" forKey:@"digest"];
    }
    
    BOOL isCache = [DZApiRequest isCache:DZ_Url_ForumTlist andParameters:dict];
    BOOL reqCache = (listType == DZ_ListAll && page == 1) ? YES : NO;
    if (!dict || !completion) {
        return;
    }
    DZRLoadType ReqLoadType = (isCache && loadType == DZRLoadCache) ? DZRLoadCache : DZRLoadRefresh;
    [DZApiRequest requestWithConfig:^(DZURLRequest *request) {
        request.urlString = DZ_Url_ForumTlist;
        request.parameters = dict.mutableCopy;
        request.loadType = ReqLoadType;
        request.isCache = reqCache;
    } success:^(id responseObject, DZRLoadType type) {
        DZThreadResModel *theadRes = [DZThreadResModel modelWithJSON:responseObject];
        completion(theadRes,isCache,DZNetError(@"", 0, @""));
    } failed:^(NSError *error) {
        completion(nil,NO,error);
    }];
}

/// 板块分类列表
+ (void)DZ_DownloadForumCategoryData:(DZRLoadType)loadType isCache:(BOOL)isCache completion:(void(^)(DiscoverModel *indexModel))completion{
    
    
    DZRLoadType ReqLoadType = loadType;
    if ([DZApiRequest isCache:DZ_Url_Forumindex andParameters:nil]) {
        ReqLoadType = (isCache && loadType == DZRLoadCache) ? DZRLoadCache : DZRLoadRefresh;
    }
    
    if (!completion) {
        return;
    }
    
    [DZApiRequest requestWithConfig:^(DZURLRequest *request) {
        request.urlString = DZ_Url_Forumindex;
        request.loadType = ReqLoadType;
    } success:^(id responseObject, DZRLoadType type) {
        DiscoverModel *forumDataModel = nil;
        NSDictionary *varibles = [responseObject dictionaryForKey:@"Variables"];
        DiscoverModel *dataModel = [DiscoverModel modelWithJSON:varibles];
        forumDataModel = [dataModel formartForumNodeData];
        if (completion) {
            completion(forumDataModel);
        }
    } failed:^(NSError *error) {
        if (completion) {
            completion(nil);
        }
    }];
}



@end
