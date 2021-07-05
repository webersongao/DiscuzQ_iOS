//
//  PRBaiduSessionManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "PRBaiduSessionManager.h"

@implementation PRBaiduSessionManager

- (NSURLSessionDataTask *)baidu_GET:(NSString *)URLString
                         parameters:(nullable id)parameters
                            headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                           progress:(nullable void (^)(NSProgress * _Nonnull))downloadProgress
                            success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                            failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, PRError * _Nonnull))failure
{
    
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"GET" URLString:URLString parameters:parameters headers:headers uploadProgress:nil downloadProgress:downloadProgress success:success failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *)baidu_PUT:(NSString *)URLString
                         parameters:(nullable id)parameters
                            headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                            success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                            failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure
{
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"PUT" URLString:URLString parameters:parameters headers:headers uploadProgress:nil downloadProgress:nil success:success failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *)baidu_POST:(NSString *)URLString
                          parameters:(nullable id)parameters
                             headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                            progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                             success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, PRError *error))failure
{
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"POST" URLString:URLString parameters:parameters headers:headers uploadProgress:uploadProgress downloadProgress:nil success:success failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}


- (NSURLSessionDataTask *)baidu_PATCH:(NSString *)URLString
                           parameters:(nullable id)parameters
                              headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                              success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                              failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure
{
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"PATCH" URLString:URLString parameters:parameters headers:headers uploadProgress:nil downloadProgress:nil success:success failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *)baidu_DELETE:(NSString *)URLString
                            parameters:(nullable id)parameters
                               headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                               success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure
{
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"DELETE" URLString:URLString parameters:parameters headers:headers uploadProgress:nil downloadProgress:nil success:success failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}




- (NSURLSessionDataTask *)baidu_HEAD:(NSString *)URLString
                          parameters:(nullable id)parameters
                             headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                             success:(nullable void (^)(NSURLSessionDataTask * _Nonnull))success
                             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, PRError * _Nonnull))failure
{
    NSURLSessionDataTask *dataTask = [self baidu_dataTaskWithHTTPMethod:@"HEAD" URLString:URLString parameters:parameters headers:headers uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask *task, __unused id responseObject) {
        if (success) {
            success(task);
        }
    } failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}

#pragma mark ========   通用网络 请求 处理方案   ===========


- (NSURLSessionDataTask *)baidu_dataTaskWithHTTPMethod:(NSString *)method
                                             URLString:(NSString *)URLString
                                            parameters:(nullable id)parameters
                                               headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                                        uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                      downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, PRError *error))failure
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    for (NSString *headerField in headers.keyEnumerator) {
        [request setValue:headers[headerField] forHTTPHeaderField:headerField];
    }
    if (serializationError) {
        if (failure) {
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, [PRError PRRrror:serializationError]);
            });
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self dataTaskWithRequest:request
                          uploadProgress:uploadProgress
                        downloadProgress:downloadProgress
                       completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                // WBS 返回一个 定制化 Error 便于寻找错误信息
                failure(dataTask,[PRError PRRrror:error response:responseObject]);
            }
        } else {
            if (success) {
                success(dataTask, responseObject);
            }
        }
    }];
    
    return dataTask;
}



@end
