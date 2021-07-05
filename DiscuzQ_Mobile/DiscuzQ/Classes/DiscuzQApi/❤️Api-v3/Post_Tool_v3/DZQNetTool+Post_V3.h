//
//  DZQNetTool+Post_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Post_V3)

/// 查询 回复 接口[列表]
-(void)DZQ_V3_PostListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询我点赞的帖子(回复)接口[列表]
-(void)DZQ_V3_PostLikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 创建回复
-(void)DZQ_V3_PostCreateWithThread:(NSString *)threadId replyId:(NSString *)replyId content:(NSString *)content isComment:(BOOL)isComment success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 删除回复
-(void)DZQ_V3_PostDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 修改回复
-(void)DZQ_V3_PostResetWithSubCtrl:(NSString *)subCtrl dataDict:(NSDictionary *)dataDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
