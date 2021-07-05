//
//  DZQNetTool+Post_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQPostV1.h"
#import "DZReportV1.h"
#import "DZQTopicV1.h"
#import "DZQThreadV1.h"
#import "DZQAttachmentV1.h"

@interface DZQNetTool (Post_V1)


/// 查询 回复 接口[列表]
-(void)DZQ_V1_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询我点赞的帖子(回复)接口[列表]
-(void)DZQ_V1_PostLikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 创建回复
-(void)DZQ_V1_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 删除回复
-(void)DZQ_V1_PostDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 修改回复
-(void)DZQ_V1_PostResetWithSubCtrl:(NSString *)subCtrl dataDict:(NSDictionary *)dataDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end


