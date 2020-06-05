//
//  DZNetCenter+Post.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Post.h"
#import "DZDiscoverTool.h"
#import "DZThreadListStyle.h"
#import "DZThreadDetailStyle.h"

@implementation DZNetCenter (Post)

/// 获取 内容分类
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZQDataCate *> *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_categoryListWithSuccess:^(DZQResModel * resModel, BOOL success) {
        NSMutableArray *cateArray = [NSMutableArray array];
        
        for (DZQBodyModel *body in resModel.dataBody) {
            DZQDataCate *cateModel = [[DZQDataCate alloc] init];
            cateModel.type = body.type;
            cateModel.type_id = body.type_id;
            cateModel.attributes = (DZQCateModel *)body.attributes;
            [cateArray addObject:cateModel];
        }
        if (completion) {
            completion([cateArray copy],resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}

/// 获取 分类列表
/*
 user    users    object    是    发表用户
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 lastPostedUser    users    object    是    最后回复用户
 category    categories    object    是    主题分类
 
 
 user.groups    groups    object    否    用户所在群组
 deletedUser    users    object    否    删除用户
 firstPost.images    attachments    array    否    首贴图片
 firstPost.likedUsers    users    array    否    点赞首帖的用户
 lastThreePosts    posts    array    否    最后三条回复
 lastThreePosts.user    users    object    否    最后三条回复的作者
 lastThreePosts.replyUser    users    object    否    最后三条回复所回复的用户
 rewardedUsers    users    array    否    打赏主题的用户
 paidUsers    users    array    否    付费主题的已购用户  (⚠️这个字段好像有问题)
 lastDeletedLog    operation-logs    object    否    最后一次被删除的操作日志
 
 */
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    NSString *query = [NSString stringWithFormat:@"filter[categoryId]=%@&include=user,firstPost,threadVideo,lastPostedUser,category,firstPost.images&page[number]=%ld",checkNull(cate_id),(long)page];
    [[DZQNetTool shared] dz_threadListWithQuery:query success:^(DZQResModel * resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool discoverResData:resModel style:[DZThreadListStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray,resModel.hasMore,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO,NO);
        }
    }];
}

/*
 user    users    object    是    主题作者
 firstPost    posts    object    是    首帖
 threadVideo    thread-video    object    是    视频
 firstPost.images    attachments    array    是    首贴图片
 firstPost.attachments    attachments    array    是    首贴附件
 posts    posts    array    是    回复列表
 posts.user    users    object    是    回复的作者
 posts.thread    threads    object    是    回复所在的主题即当前主题
 posts.images    attachments    array    是    回复的图片
 
 user.groups    groups    object    否    用户所在群组
 category    categories    object    否    主题分类
 firstPost.likedUsers    users    array    否    点赞首贴的用户
 posts.likedUsers    users    array    否    点赞回复的用户
 rewardedUsers    users    array    否    打赏主题的用户
 paidUsers    users    array    否    付费主题的已购用户
 firstPost.mentionUsers    users    array    否    主题@用户
 posts.mentionUsers    users    array    否    回复@用户
 */
-(void)dzx_threadOneWithThreadId:(NSString *)thread_id page:(NSInteger)page completion:(void (^)(DZQDataThread *threadData,BOOL success))completion{
    
    NSString *defaultStr = @"user,firstPost,threadVideo,firstPost.images,firstPost.attachments,posts,posts.user,posts.thread,posts.images";
    NSString *query = [NSString stringWithFormat:@"include=%@,firstPost.likedUsers,rewardedUsers&page[number]=%ld",defaultStr,(long)page];
    [[DZQNetTool shared] dz_threadOneWithSubCtrl:thread_id query:query success:^(DZQResModel *resModel, BOOL success) {
        dispatch_async(self.formartQueue, ^{
            NSArray *dataArray = [DZDiscoverTool discoverResData:resModel style:[DZThreadDetailStyle class]];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(dataArray.firstObject,success);
                }
            });
        });
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}


@end
