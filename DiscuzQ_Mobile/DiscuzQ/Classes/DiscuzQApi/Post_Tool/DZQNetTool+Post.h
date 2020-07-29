//
//  DZQNetTool+Post.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQPostModel.h"
#import "DZReportModel.h"
#import "DZQTopicModel.h"
#import "DZQThreadModel.h"
#import "DZQAttachmentModel.h"

@interface DZQNetTool (Post)


/// 查询 回复 接口[列表]
-(void)dz_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询我点赞的帖子(回复)接口[列表]
-(void)dz_PostLikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 创建回复
-(void)dz_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 删除回复
-(void)dz_PostDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 修改回复
-(void)dz_PostResetWithSubCtrl:(NSString *)subCtrl dataDict:(NSDictionary *)dataDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end


