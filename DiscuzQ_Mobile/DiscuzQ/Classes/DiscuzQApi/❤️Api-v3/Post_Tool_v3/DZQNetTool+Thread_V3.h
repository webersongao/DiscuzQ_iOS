//
//  DZQNetTool+Thread_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQThreadV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Thread_V3)

/// 获取 分类帖子列表
-(void)DZQ_V3_ThreadListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询主题接口[单条]
-(void)DZQ_V3_ThreadOneWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 分享主题时获取主题信息接口[单条]
-(void)DZQ_V3_ThreadShareWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户 收藏 主题列表
-(void)DZQ_V3_ThreadFavoriteListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户 点赞 主题列表
-(void)DZQ_V3_Thread_UserlikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

///// 创建主题接口
-(void)DZQ_V3_ThreadCreateWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

///// 创建视频主题
-(void)DZQ_V3_ThreadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


///// 删除主题
-(void)DZQ_V3_ThreadDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


///// 修改主题内容
-(void)DZQ_V3_ThreadResetWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 创建云点播前端上传签名
-(void)DZQ_V3_ThreadUploadSignatureWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
