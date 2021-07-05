//
//  PRBaiduHttpClient.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/8/10.
//

#import <Foundation/Foundation.h>
#import "PRBaiduManager.h"

@interface PRBaiduHttpClient : NSObject

@property(nonatomic,strong,readonly) PRBaiduSessionManager *jsonManager;
@property(nonatomic,strong,readonly) PRBaiduSessionManager *dataManager;

/**
 *  初始化
 *
 *  @return 对象
 */
+ (PRBaiduHttpClient *)DZQClient;

+ (PRBaiduHttpClient *)defaultClient;


/// 移除当前正在请求的operation
/// @param taskUrlTag taskUrlTag
- (void)baidu_CancelFileTask:(long)taskUrlTag;

/**
 *  设置头
 *
 *  @param parameters 头
 */
- (void)baidu_SetHeaderDesign:(NSDictionary *)parameters manager:(PRBaiduSessionManager *)manager;


/**
 * GET 请求（ GET JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_GetReqWithUrl:(NSString *)URLString
                     urlTag:(long)urlTag
                    success:(void (^)(id response))success
                    failure:(void (^)(PRError *error))failure
                     cancel:(void (^)(void))cancel;

/**
 *  POST 请求（ POST JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PostReqWithUrl:(NSString *)URLString
                      urlTag:(long)urlTag
                  parameters:(id)parameters
                     success:(void (^)(id response))success
                     failure:(void (^)(PRError *error))failure
                      cancel:(void (^)(void))cancel;


/**
 *  HTTP请求（ Patch JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PatchReqWithUrl:(NSString *)URLString
                       urlTag:(long)urlTag
                   parameters:(id)parameters
                      success:(void (^)(id response))success
                      failure:(void (^)(PRError *error))failure
                       cancel:(void (^)(void))cancel;


/**
 *  HTTP请求（ Delete JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_DeleteReqWithUrl:(NSString *)URLString
                        urlTag:(long)urlTag
                    parameters:(id)parameters
                       success:(void (^)(id response))success
                       failure:(void (^)(PRError *error))failure
                        cancel:(void (^)(void))cancel;

/**
 *  HTTP请求（ Head JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_HeadReqWithUrl:(NSString *)URLString
                      urlTag:(long)urlTag
                  parameters:(id)parameters
                     success:(void (^)(id response))success
                     failure:(void (^)(PRError *error))failure
                      cancel:(void (^)(void))cancel;

/**
 WBS 文件上传（无公共上行）
 */
- (long)baidu_UploadReqWithUrl:(NSString *)URLString
                    parameters:(id)parameters
                        urlTag:(long)urlTag
               appendBodyBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(void (^)(NSProgress * upProgress))uploadProgress
                       success:(void (^)(id response))success
                       failure:(void (^)(PRError *error))failure
                        cancel:(void (^)(void))cancel;


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


/**
 *  HTTP请求（GET、POST、DELETE、PUT、PATCH）
 * 一律不加公共上行的请求
 *  @param URLString    网址
 *  @param urlTag       标记
 *  @param method     RESTFul请求类型
 *  @param reponseType 请求参数
 *  @param parameters 请求参数
 *  @param success    请求成功处理块
 *  @param failure    请求失败处理块
 *  @param cancel     请求取消处理块
 */
- (long)baidu_CommonRequestWithUrl:(NSString *)URLString
                            urlTag:(long)urlTag
                            method:(PRRequestType)method
                       reponseType:(PRResponseType)reponseType
                        parameters:(id)parameters
                           success:(void (^)(id response))success
                           failure:(void (^)(PRError *error))failure
                            cancel:(void (^)(void))cancel;


/**
 网络状态监测
 */
- (void)baidu_startNetMonitor:(void (^)(AFNetworkReachabilityStatus status))block;


@end








