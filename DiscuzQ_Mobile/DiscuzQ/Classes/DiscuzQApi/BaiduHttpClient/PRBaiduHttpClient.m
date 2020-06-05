//
//  PRBaiduHttpClient.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/8/10.
//

#import "PRBaiduHttpClient.h"
#import "DZQMacroHeader.h"

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

/// 常用 不带有公共上行的网络请求
- (long)baidu_CommonRequestWithUrl:(NSString *)URLString
                            urlTag:(long)urlTag
                            method:(PRRequestType)method
                       reponseType:(PRResponseType)reponseType
                        parameters:(id)parameters
                           success:(void (^)(NSURLSessionDataTask *task, id response))success
                           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                            cancel:(void (^)(void))cancel
{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:method reponseType:reponseType parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}

/**
 *  HTTP请求（ GET JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_GetRequestWithUrl:(NSString *)URLString
                         urlTag:(long)urlTag
                        success:(void (^)(NSURLSessionDataTask *task, id response))success
                        failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                         cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestGet reponseType:PRResponseJson parameters:nil success:success failure:failure cancel:cancel];
    return tag;
}

/**
 *  HTTP请求（ POST JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PostRequestWithUrl:(NSString *)URLString
                          urlTag:(long)urlTag
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, id response))success
                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                          cancel:(void (^)(void))cancel{
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:PRRequestPost reponseType:PRResponseJson parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}

/// 带有 某些指定的公共上行参数的网络请求
- (long)baidu_CommonParametersRequestWithUrl:(NSString *)URLString
                                      urlTag:(long)urlTag
                                      method:(PRRequestType)method
                                 reponseType:(PRResponseType)reponseType
                                  parameters:(id)parameters
                                     success:(void (^)(NSURLSessionDataTask *task, id response))success
                                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                                      cancel:(void (^)(void))cancel

{
    //拼接公共上行
    URLString = [self appendCommonParamsUrl:URLString];
    
#ifndef MACRO_PRODUCT
    [self rebuiltUrlParams:parameters url:URLString];
#endif
    
    long tag = [self baidu_innerRequestWithUrl:URLString urlTag:urlTag method:method reponseType:reponseType parameters:parameters success:success failure:failure cancel:cancel];
    return tag;
}

/**
 WBS 百度文件上传（无公共上行）
 */
- (void)baidu_UploadRequestWithUrl:(NSString *)URLString
                       reponseType:(PRResponseType)reponseType
                        parameters:(id)parameters
                            urlTag:(long)urlTag
                   appendBodyBlock:(void (^)(id <AFMultipartFormData> formData))block
                          progress:(void (^)(NSProgress * upProgress))uploadProgress
                           success:(void (^)(NSURLSessionDataTask *task, id response))success
                           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                            cancel:(void (^)(void))cancel
{
    //处理响应数据类型配置
    AFHTTPSessionManager *manager = [self baidu_ManagerWithResType:reponseType];
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (success != nil) {
            success(urlSessiontask,responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, NSError *error) {
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
                failure(urlSessiontask,error); //正常访问失败的回调
            }
        }
    };
    
    NSURLSessionDataTask *dataTask = [manager POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:block progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successCallBack(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallBack(task,error);
    }];
    //记住当前网络请求的tag对应的operation
    if (urlTag > 0 && dataTask) {
        [m_taskLock lock];
        [m_opertaionsDict setObject:dataTask forKey:[NSNumber numberWithLong:urlTag]];
        [m_taskLock unlock];
    }
    
}

/**
 WBS 文件下载（无公共上行）
 */
- (void)baidu_downloadRequestWithUrl:(NSString *)URLString
                         reponseType:(PRResponseType)reponseType
                          parameters:(id)parameters
                              urlTag:(long)urlTag
                            progress:(void (^)(NSProgress * downProgress))downloadProgress
                             success:(void (^)(NSURLSessionDataTask *task, id response))success
                             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                              cancel:(void (^)(void))cancel;
{
    //处理响应数据类型配置
    AFHTTPSessionManager *manager = [self baidu_ManagerWithResType:reponseType];
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        
        if (success != nil) {
            success(urlSessiontask,responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, NSError *error) {
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
                failure(urlSessiontask,error); //正常访问失败的回调
            }
        }
    };
    NSURLSessionDataTask *dataTask = [manager GET:URLString parameters:parameters headers:nil progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successCallBack(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallBack(task,error);
    }];
    //记住当前网络请求的tag对应的operation
    if (urlTag > 0 && dataTask) {
        [m_taskLock lock];
        [m_opertaionsDict setObject:dataTask forKey:[NSNumber numberWithLong:urlTag]];
        [m_taskLock unlock];
    }
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
- (void)baidu_SetHeaderDesign:(NSDictionary *)parameters manager:(AFHTTPSessionManager *)manager
{
    AFHTTPRequestSerializer *requetSerializer = manager.requestSerializer;
    requetSerializer.timeoutInterval = Baidu_REQUEST_TIME;
    for (NSString *key in parameters.allKeys) {
        NSString *value = [parameters valueForKey:key];
        [requetSerializer setValue:value forHTTPHeaderField:key];
    }
}

/**
 网络状态监测  -- 暂时没使用
 */
- (void)baidu_startNetMonitor:(void (^)(AFNetworkReachabilityStatus status))block
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:block];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}



-(void)rebuiltUrlParams:(NSDictionary *)rootDictionary url:(NSString *)requestUrl{
    
    KSLog(@"请求链接：requestURL is \n\n %@ \n\n",[DataCheck rebuiltParams:rootDictionary url:requestUrl]);
}

/**
 *  拼接公共上行
 *
 *  @param baseUrl 含有空格必须编码不然af不兼容崩溃
 *
 *  @return urlString
 */
- (NSString *)appendCommonParamsUrl:(NSString *)baseUrl
{
    if (baseUrl && ([baseUrl rangeOfString:@"p16="].location == NSNotFound)) {
        baseUrl = addUrlParam(baseUrl,DZQ_from_TAG);
    }
    return [baseUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}


NSString* addUrlParam(NSString *baseurl, NSString *param)
{
    if(!baseurl || [baseurl length] == 0
       || !param || [param length] == 0)
        return baseurl;
    
    NSString* resultUrl = @"";
    if ([baseurl rangeOfString:@"?"].length == 0)
    {
        resultUrl = [NSString stringWithFormat:@"%@?%@", baseurl, param];
    }
    else
    {
        if([baseurl hasSuffix:@"?"])
        {
            //以?结尾,不带&
            resultUrl = [NSString stringWithFormat:@"%@%@", baseurl, param];
        }
        else
        {
            //存在?,但是不以?结尾,带&
            resultUrl = [NSString stringWithFormat:@"%@&%@", baseurl, param];
        }
    }
    return resultUrl;
}


- (long)baidu_innerRequestWithUrl:(NSString *)url
                           urlTag:(long)urlTag
                           method:(PRRequestType)method
                      reponseType:(PRResponseType)reponseType
                       parameters:(id)parameters
                          success:(void (^)(NSURLSessionDataTask *task, id response))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                           cancel:(void (^)(void))cancel
{
    //处理响应数据类型配置
    AFHTTPSessionManager *httpSessionManager = [self baidu_ManagerWithResType:reponseType];
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak PRBaiduHttpClient *weakself = self;
    void (^successCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, id responseData) {
        [weakself baidu_removeCurrentFileTask:urlTag];
        if (success != nil) {
            success(urlSessiontask,responseData);
        }
    };
    
    //创建block请求失败回调,是为了留下一个统一一个回调处理的地方
    void (^failureCallBack)(NSURLSessionDataTask *task, id) = ^(NSURLSessionDataTask *urlSessiontask, NSError *error) {
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
                failure(urlSessiontask,error); //正常访问失败的回调
            }
        }
    };
    
    NSURLSessionTask *task;
    switch (method) {
        case PRRequestGet:
        {
            task = [httpSessionManager GET:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureCallBack(task, error);
            }];
        }
            break;
        case PRRequestPost:
        {
            task = [httpSessionManager POST:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        case PRRequestDelete:
        {
            task = [httpSessionManager DELETE:url parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureCallBack(task, error);
            }];
        }
            break;
        case PRRequestPut:
        {
            task = [httpSessionManager PUT:url parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureCallBack(task,error);
            }];
        }
            break;
        case PRRequestPatch:
        {
            task = [httpSessionManager PATCH:url parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
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



/// ++++++++++++=======  通用配置项  ========++++++++++++

- (AFHTTPSessionManager *)jsonManager
{
    if (!_jsonManager) {
        [m_taskLock lock];
        _jsonManager = [AFHTTPSessionManager manager];
        _jsonManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _jsonManager.requestSerializer.timeoutInterval = 60.0;
        _jsonManager.responseSerializer = [self baidu_resSerializerType:PRResponseJson];
        [m_taskLock unlock];
    }
    return _jsonManager;
}

- (AFHTTPSessionManager *)dataManager
{
    if (!_dataManager) {
        [m_taskLock lock];
        _dataManager = [AFHTTPSessionManager manager];
        _dataManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _dataManager.requestSerializer.timeoutInterval = 60.0;
        _dataManager.responseSerializer = [self baidu_resSerializerType:PRResponseData];
        [m_taskLock unlock];
    }
    return _dataManager;
}

- (AFHTTPSessionManager *)xmlManager
{
    if (!_xmlManager) {
        [m_taskLock lock];
        _xmlManager = [AFHTTPSessionManager manager];
        _xmlManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _xmlManager.requestSerializer.timeoutInterval = 60.0;
        _xmlManager.responseSerializer = [self baidu_resSerializerType:PRResponseXML];
        [m_taskLock unlock];
    }
    return _xmlManager;
}

//避免多线程访问导致返回数据格式不对,所以分三大类请求都分配一类manager
- (AFHTTPSessionManager *)baidu_ManagerWithResType:(PRResponseType)reponseType
{
    AFHTTPSessionManager *_manager;
    switch (reponseType) {
        case PRResponseJson:
            _manager = self.jsonManager;
            break;
        case PRResponseData:
            _manager = self.dataManager;
            break;
        case PRResponseXML:
            _manager = self.xmlManager;
            break;
    }
    return _manager;
}



//响应数据类型
- (AFHTTPResponseSerializer *)baidu_resSerializerType:(PRResponseType)type
{
    
    AFHTTPResponseSerializer *responseSerializer;
    switch (type) {
        case PRResponseJson:
        {
            responseSerializer = [AFJSONResponseSerializer serializer];
            responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/vnd.api+json",nil];
        }
            break;
        case PRResponseXML:
        {
            responseSerializer = [AFXMLParserResponseSerializer serializer];
        }
        case PRResponseData:
        {
            //data
            responseSerializer = [AFHTTPResponseSerializer serializer];
        }
            break;
        default:
            responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
    }
    
    return responseSerializer;
}



@end












