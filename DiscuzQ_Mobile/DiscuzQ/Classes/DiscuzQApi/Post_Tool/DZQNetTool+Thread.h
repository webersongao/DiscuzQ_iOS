//
//  DZQNetTool+Thread.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQVideoModel.h"

@interface DZQNetTool (Thread)

/// 获取 分类帖子列表
-(void)dz_threadListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 查询主题接口[单条]
-(void)dz_threadOneWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 分享主题时获取主题信息接口[单条]
-(void)dz_threadShareWithSubCtrl:(NSString *)subCtrl query:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户 收藏 主题列表
-(void)dz_threadFavoriteListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户 点赞 主题列表
-(void)dz_thread_UserlikeListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

///// 创建主题接口
-(void)dz_threadCreateWithPara:(NSDictionary *)parameters success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

///// 创建视频主题
-(void)dz_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


///// 删除主题
-(void)dz_threadDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


///// 修改主题内容
-(void)dz_threadResetWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 创建云点播前端上传签名
-(void)dz_thread_UploadSignatureWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


