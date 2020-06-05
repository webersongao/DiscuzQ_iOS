//
//  DZThreadNetTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZApiRequest.h"
#import "DZThreadResModel.h"

@class DiscoverModel;

typedef enum : NSUInteger {
    DZ_ListAll = 0, /// 全部
    DZ_ListNew, /// 最新
    DZ_ListHot, /// 热门
    DZ_ListBest, /// 精华
    DZ_ListPoll, /// 投票
    DZ_ListHotThread, /// 热帖
} DZ_ListType;

@interface DZThreadNetTool : NSObject

/// 板块下级，帖子列表
+ (void)DZ_DownloadForumListWithType:(DZRLoadType)loadType fid:(NSString *)fid page:(NSInteger)page listType:(DZ_ListType)listType completion:(void(^)(DZThreadResModel *threadResModel,BOOL isCache,NSError *error))completion;

/// 板块分类列表
+ (void)DZ_DownloadForumCategoryData:(DZRLoadType)loadType isCache:(BOOL)isCache completion:(void(^)(DiscoverModel *indexModel))completion;




@end


