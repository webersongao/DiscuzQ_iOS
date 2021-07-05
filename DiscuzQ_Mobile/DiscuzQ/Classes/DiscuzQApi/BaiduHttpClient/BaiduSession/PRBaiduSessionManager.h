//
//  PRBaiduSessionManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "AFNetworking.h"
#import "PRError.h"
NS_ASSUME_NONNULL_BEGIN

@interface PRBaiduSessionManager : AFHTTPSessionManager

- (NSURLSessionDataTask *)baidu_GET:(NSString *)URLString
                         parameters:(nullable id)parameters
                            headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                           progress:(nullable void (^)(NSProgress * _Nonnull))downloadProgress
                            success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                            failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, PRError * _Nonnull))failure;


- (NSURLSessionDataTask *)baidu_PUT:(NSString *)URLString
                         parameters:(nullable id)parameters
                            headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                            success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                            failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure;


- (NSURLSessionDataTask *)baidu_POST:(NSString *)URLString
                          parameters:(nullable id)parameters
                             headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                            progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                             success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, PRError *error))failure;


- (NSURLSessionDataTask *)baidu_PATCH:(NSString *)URLString
                           parameters:(nullable id)parameters
                              headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                              success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                              failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure;



- (NSURLSessionDataTask *)baidu_DELETE:(NSString *)URLString
                            parameters:(nullable id)parameters
                               headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                               success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask *task, PRError *error))failure;



- (NSURLSessionDataTask *)baidu_HEAD:(NSString *)URLString
                          parameters:(nullable id)parameters
                             headers:(nullable NSDictionary<NSString *,NSString *> *)headers
                             success:(nullable void (^)(NSURLSessionDataTask * _Nonnull))success
                             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, PRError * _Nonnull))failure;

@end

NS_ASSUME_NONNULL_END
