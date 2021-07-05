//
//  DZNetCenter+Thread.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Thread.h"
#import "DZNetCenter+API_V1_0.h"
#import "DZNetCenter+API_V3_0.h"
#import "DZNetFormatter+Adapter.h"

@implementation DZNetCenter (Thread)

/// 获取 特定分类 下主题列表
-(void)dzx_threadListWithCate:(NSString *)cate_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithCate:cate_id page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}

/// 获取 特定分类 下主题列表 (是否精华 以及已关注)
-(void)dzx_threadListWithSuperCate:(NSString *)cate_id morefilter:(NSString *)morefilter  page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithSuperCate:cate_id morefilter:morefilter page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}

/// 主题搜索（关键词） 列表
-(void)dzx_threadListSearchWithKey:(NSString *)keyWord page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListSearchWithKey:keyWord page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}

/// 获取 特定用户id 主题列表
-(void)dzx_threadListWithUser:(NSString *)userId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithUser:userId page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 用户名搜索 主题列表
-(void)dzx_threadListWithUserName:(NSString *)username page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithUserName:username page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 获取 【 精华、置顶 】主题列表
/// @param isEssence 是否是精华
/// @param isSticky 是否是 置顶
-(void)dzx_threadListWithEssence:(BOOL)isEssence isSticky:(BOOL)isSticky page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithEssence:isEssence isSticky:isSticky page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 某人 关注的 主题列表（会验证是否为当前登录用户）
-(void)dzx_threadListWithFollowUser:(NSString *)fromUserId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithFollowUser:fromUserId page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


/// 获取 特定类型的 主题列表 （0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖）
-(void)dzx_threadListWithType:(NSInteger)type page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithType:type page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}


/// 获取 特定话题 的 主题列表
-(void)dzx_threadListWithTopic:(NSString *)topicId page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadListWithTopic:topicId page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}


-(void)dzx_threadOneWithThreadId:(NSString *)thread_id completion:(void (^)(DZQDataThread *threadData,BOOL success))completion{
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak DZNetCenter *weakMself = self;
    void (^successCallBack)(id resModel, BOOL) = ^(id resModel, BOOL success) {
       __block DZThreadM *threadM = nil;
        formatterCenter_async_task(^{
            threadM = [weakMself.formatter thread_ConvertWithObj:resModel].firstObject;
        }, ^{
//            if (completion) {
//                completion(threadM,success);
//            }
        });
    };
    
    if (self.sdkVersion == 3.0) {
        [self dzApiv3_threadOneWithThreadId:thread_id completion:successCallBack];
    }else{
        [self dzApiv1_threadOneWithThreadId:thread_id completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
            if (completion) {
                completion(threadData,success);
            }
        }];
    }
}



/// 分享主题时获取主题信息接口[单条]
-(void)dzx_threadShareWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *dataThread,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadShareWithThread:thread_id completion:^(DZQDataThread * _Nonnull dataThread, BOOL success) {
            if (completion) {
                completion(dataThread,success);
            }
        }];
    }
}



/// 收藏 主题 列表
-(void)dzx_threadFavoriteListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadFavoriteListWithUser:user_id page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
        
    }
}




/// 用户 点赞 主题列表
-(void)dzx_thread_UserlikeListWithUser:(NSString *)user_id page:(NSInteger)page completion:(void (^)(NSArray<DZQDataThread *> *varModel,BOOL hasMore,BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_thread_UserlikeListWithUser:user_id page:page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
}


/// 查询我点赞的 评论回复 接口[列表]
-(void)dzx_PostLikedListWithPage:(NSInteger)page completion:(void (^)(NSArray<DZQDataPost *> *varModel,BOOL hasMore,BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_PostLikedListWithPage:page completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
            if (completion) {
                completion(varModel,hasMore,success);
            }
        }];
    }
    
}

///// 删除主题
-(void)dzx_threadDeleteWithThread:(NSString *)thread_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadDeleteWithThread:thread_id completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(nil,success);
            }
        }];
        
//        [self dzApiv1_threadReset_DeleteWithThread:thread_id isDeleted:YES completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
//            if (completion) {
//                completion(nil,success);
//            }
//        }];
    }
}

#pragma mark ====  【【【【 主题的创建 - 普通，长文，图片 视频，问答，语音，商品 】】】】相关操作

///// 创建视频主题（回调）
/*
 file_id    string    是    视频上传后返回的 file_id
 file_name    string    否    视频文件名称
 */
-(void)dzx_threadCreateVideoWithFile:(NSString *)file_id file_name:(NSString *)file_name completion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadCreateVideoWithFile:file_id file_name:file_name completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

///// 创建主题接口
-(void)dzx_threadPublishWithPara:(DZThreadDraftM *)threadpPara captcha:(NSDictionary *)captcha completion:(void (^)(DZQDataUser *varModel, BOOL success))completion failure:(void (^)(DZQErrorV1 * varModel))failure{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadPublishWithPara:threadpPara captcha:captcha completion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        } failure:^(DZQErrorV1 * _Nonnull varModel) {
            if (failure) {
                failure(varModel);
            }
        }];
    }
    
}



/// 创建云点播前端上传签名
-(void)dzx_thread_UploadSignatureWithCompletion:(void (^)(DZQDataUser *varModel, BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_thread_UploadSignatureWithCompletion:^(DZQDataUser * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}

#pragma mark ====  【【【【 主题的修改 - 置顶，加精，收藏 修改分类，修改内容 】】】】相关操作

//// 加精 主题
-(void)dzx_threadEssenceWithThread:(NSString *)thread_id isEssence:(BOOL)isEssence completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadEssenceWithThread:thread_id isEssence:isEssence completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}

//// 置顶 主题
-(void)dzx_threadStickyWithThread:(NSString *)thread_id isSticky:(BOOL)isSticky completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadStickyWithThread:thread_id isSticky:isSticky completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
    
}

//// 收藏 主题
-(void)dzx_threadFavoriteWithThread:(NSString *)thread_id isFavorite:(BOOL)isFavorite completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadFavoriteWithThread:thread_id isFavorite:isFavorite completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}

//// 修改分类
-(void)dzx_threadResetCateWithThread:(NSString *)thread_id cate:(NSString *)cate_id completion:(void (^)(DZQDataThread *varModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_threadResetCateWithThread:thread_id cate:cate_id completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}




@end
