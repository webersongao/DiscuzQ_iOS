//
//  PRBaiduHttpClient.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/8/10.
//

#import "PRBaiduHttpClient.h"
#import "DZQMacroHeader.h"
#import "NSString+HTTPURL.h"

@interface PRBaiduHttpClient ()
{
    NSRecursiveLock * m_taskLock;
    NSMutableDictionary * m_opertaionsDict;
}

@end

@implementation PRBaiduHttpClient

- (id)init{
    if (self = [super init]){
        //保持正在执行的operation(网络请求)
        m_taskLock = [[NSRecursiveLock alloc] init];
        _jsonManager = [PRBaiduManager DZQConfig].baidu_jsonConfigManager;
        _dataManager = [PRBaiduManager DZQConfig].baidu_dataConfigManager;
        m_opertaionsDict = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return self;
}

+ (PRBaiduHttpClient *)DZQClient
{
    static PRBaiduHttpClient *DZQIstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        DZQIstance = [[self alloc] init];
    });
    return DZQIstance;
}

+ (PRBaiduHttpClient *)defaultClient
{
    static PRBaiduHttpClient *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

/**
 *  移除当前正在请求的operation
 */
- (void)baidu_CancelFileTask:(long)taskUrlTag{
    
    NSNumber *urlTagNum = [NSNumber numberWithLong:taskUrlTag];
    NSURLSessionTask *task = [m_opertaionsDict objectForKey:urlTagNum];
    if (task) {
        [task cancel];
    }
    [self baidu_removeCurrentFileTask:taskUrlTag];
}

//定制化头信息和请求时长
- (void)baidu_SetHeaderDesign:(NSDictionary *)parameters manager:(PRBaiduSessionManager *)manager
{
    AFHTTPRequestSerializer *requetSerializer = manager.requestSerializer;
    requetSerializer.timeoutInterval = Baidu_REQUEST_TIME;
    for (NSString *key in parameters.allKeys) {
        NSString *value = [parameters valueForKey:key];
        [requetSerializer setValue:value forHTTPHeaderField:key];
    }
}


/**
 *  HTTP请求（ GET JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_GetReqWithUrl:(NSString *)URLString
                     urlTag:(long)urlTag
                    success:(void (^)(id response))success
                    failure:(void (^)(PRError *error))failure
                     cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestGet reponseType:PRResponseJson parameters:nil success:success failure:failure cancel:cancel];
    return tag;
}

/**
 *  HTTP请求（ POST JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PostReqWithUrl:(NSString *)URLString
                      urlTag:(long)urlTag
                  parameters:(id)parameters
                     success:(void (^)(id response))success
                     failure:(void (^)(PRError *error))failure
                      cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestPost reponseType:PRResponseJson parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}

/**
 *  HTTP请求（ Patch JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PatchReqWithUrl:(NSString *)URLString
                       urlTag:(long)urlTag
                   parameters:(id)parameters
                      success:(void (^)(id response))success
                      failure:(void (^)(PRError *error))failure
                       cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestPatch reponseType:PRResponseJson parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}


/**
 *  HTTP请求（ Delete JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_DeleteReqWithUrl:(NSString *)URLString
                        urlTag:(long)urlTag
                    parameters:(id)parameters
                       success:(void (^)(id response))success
                       failure:(void (^)(PRError *error))failure
                        cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestDelete reponseType:PRResponseJson parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}

/**
 *  HTTP请求（ Head JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_HeadReqWithUrl:(NSString *)URLString
                      urlTag:(long)urlTag
                  parameters:(id)parameters
                     success:(void (^)(id response))success
                     failure:(void (^)(PRError *error))failure
                      cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestHead reponseType:PRResponseJson parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}


/**
 WBS 百度文件上传（无公共上行）
 */
- (long)baidu_UploadReqWithUrl:(NSString *)URLString
                    parameters:(id)parameters
                        urlTag:(long)urlTag
               appendBodyBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(void (^)(NSProgress * upProgress))uploadProgress
                       success:(void (^)(id response))success
                       failure:(void (^)(PRError *error))failure
                        cancel:(void (^)(void))cancel
{
    //处理响应数据类型配置
    PRBaiduSessionManager *manager = self.jsonManager;
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (success != nil) {
            success(responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, PRError *error) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (error.code == Baidu_CANCEL_CODE) {
            if (cancel != nil) {
                cancel(); //取消正在请求的回调
            }
        } else {
            if (error.code == Baidu_NONENET_CODE || error.code == Baidu_ERRORNET_CODE){
                //发出网络异常通知广播，注意：先注释了，有需求就外面自己需要自己发通知弹框
            }
            if (failure != nil) {
                failure(error); //正常访问失败的回调
            }
        }
    };
    
    NSURLSessionDataTask *dataTask = [manager POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:block progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successCallBack(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallBack(task,[PRError PRRrror:error]);
    }];
    //记住当前网络请求的tag对应的operation
    if (urlTag > 0 && dataTask) {
        [m_taskLock lock];
        [m_opertaionsDict setObject:dataTask forKey:[NSNumber numberWithLong:urlTag]];
        [m_taskLock unlock];
    }
    
    return urlTag;
}

/**
 WBS 文件下载（无公共上行）
 */
- (long)baidu_downloadReqWithUrl:(NSString *)URLString
                      parameters:(id)parameters
                          urlTag:(long)urlTag
                        progress:(void (^)(NSProgress * downProgress))downloadProgress
                         success:(void (^)(id response))success
                         failure:(void (^)(PRError *error))failure
                          cancel:(void (^)(void))cancel;
{
    //处理响应数据类型配置
    PRBaiduSessionManager *manager = self.jsonManager;
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (success != nil) {
            success(responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, PRError *error) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (error.code == Baidu_CANCEL_CODE) {
            if (cancel != nil) {
                cancel(); //取消正在请求的回调
            }
        } else {
            if (error.code == Baidu_NONENET_CODE || error.code == Baidu_ERRORNET_CODE){
                //发出网络异常通知广播，注意：先注释了，有需求就外面自己需要自己发通知弹框
            }
            if (failure != nil) {
                failure(error); //正常访问失败的回调
            }
        }
    };
    NSURLSessionDataTask *dataTask = [manager GET:URLString parameters:parameters headers:nil progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successCallBack(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallBack(task,[PRError PRRrror:error]);
    }];
    //记住当前网络请求的tag对应的operation
    if (urlTag > 0 && dataTask) {
        [m_taskLock lock];
        [m_opertaionsDict setObject:dataTask forKey:[NSNumber numberWithLong:urlTag]];
        [m_taskLock unlock];
    }
    
    return urlTag;
}

/// 移除当前记住的operation
/// @param urlTag urlTag
- (void)baidu_removeCurrentFileTask:(long)urlTag
{
    NSNumber *urlTagNum = [NSNumber numberWithLong:urlTag];
    
    [m_taskLock lock];
    [m_opertaionsDict removeObjectForKey:urlTagNum];
    [m_taskLock unlock];
    
}



/// 常用 不带有公共上行的网络请求
- (long)baidu_CommonRequestWithUrl:(NSString *)URLString
                            urlTag:(long)urlTag
                            method:(PRRequestType)method
                       reponseType:(PRResponseType)reponseType
                        parameters:(id)parameters
                           success:(void (^)(id response))success
                           failure:(void (^)(PRError *error))failure
                            cancel:(void (^)(void))cancel
{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:method reponseType:reponseType parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}


/**
 网络状态监测  -- 暂时没使用
 */
- (void)baidu_startNetMonitor:(void (^)(AFNetworkReachabilityStatus status))block
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:block];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


- (long)baidu_innerRequestWithUrl:(NSString *)URLString
                           urlTag:(long)urlTag
                           method:(PRRequestType)method
                      reponseType:(PRResponseType)reponseType
                       parameters:(id)parameters
                          success:(void (^)(id response))success
                          failure:(void (^)(PRError *error))failure
                           cancel:(void (^)(void))cancel
{
    
#ifndef MACRO_PRODUCT
    [NSString rebuiltUrlParams:parameters url:URLString];
#endif
    
    //拼接公共上行
    URLString = [NSString appendCommonParamsUrl:URLString];
    
    //处理响应数据类型配置
    PRBaiduSessionManager *httpSessionManager = [[PRBaiduManager DZQConfig] baidu_ManagerWithResType:reponseType];
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (success != nil) {
            success(responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, PRError *error) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (error.code == Baidu_CANCEL_CODE) {
            if (cancel != nil) {
                cancel(); //取消正在请求的回调
            }
        } else {
            if (error.code == Baidu_NONENET_CODE || error.code == Baidu_ERRORNET_CODE){
                //发出网络异常通知广播，注意：先注释了，有需求就外面自己需要自己发通知弹框
            }
            if (failure != nil) {
                failure(error); //正常访问失败的回调
            }
        }
    };
    
    NSURLSessionTask *task;
    switch (method) {
        case PRRequestGet:
        {
            task = [httpSessionManager baidu_GET:URLString parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task, error);
            }];
        }
            break;
        case PRRequestPut:
        {
            task = [httpSessionManager baidu_PUT:URLString parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        case PRRequestPost:
        {
            task = [httpSessionManager baidu_POST:URLString parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        case PRRequestHead:
        {
            task = [httpSessionManager baidu_HEAD:URLString parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task) {
                successCallBack(task,nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        case PRRequestDelete:
        {
            task = [httpSessionManager baidu_DELETE:URLString parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task, error);
            }];
        }
            break;
        case PRRequestPatch:
        {
            task = [httpSessionManager baidu_PATCH:URLString parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, PRError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        default:
            break;
    }
    
    //记住当前网络请求的tag对应的operation
    if (urlTag > 0 && task) {
        [m_taskLock lock];
        [m_opertaionsDict setObject:task forKey:[NSNumber numberWithLong:urlTag]];
        [m_taskLock unlock];
    }
    
    return urlTag;
    
}



@end


















