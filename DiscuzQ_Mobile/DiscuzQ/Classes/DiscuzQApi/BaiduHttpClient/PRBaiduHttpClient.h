//
//  PRBaiduHttpClient.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/8/10.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

static double Baidu_REQUEST_TIME = 30.0;

static NSInteger Baidu_CANCEL_CODE = -999; //取消网络
static NSInteger Baidu_NONENET_CODE = -1009; // 没网
static NSInteger Baidu_ERRORNET_CODE = -1001; //网不正常上不去


typedef void(^PRNoneBlock)(void);
typedef void(^PRBoolBlock)(BOOL *success);
typedef void(^PRFailureBlock)(NSError *error);
typedef void(^PRCompleteBlock)(id data,BOOL success);
typedef void(^PRProgressBlock)(double Progress,NSError *error);

typedef NS_ENUM(NSInteger, PRRequestType){
    PRRequestGet,
    PRRequestPut,
    PRRequestPost,
    PRRequestPatch,
    PRRequestDelete,
};

typedef NS_ENUM(NSInteger, PRResponseType){
    PRResponseJson,
    PRResponseXML,
    PRResponseData,
};


@interface PRBaiduHttpClient : NSObject

@property(nonatomic,strong) AFHTTPSessionManager *jsonManager;
@property(nonatomic,strong) AFHTTPSessionManager *dataManager;
@property(nonatomic,strong) AFHTTPSessionManager *xmlManager;

/**
 *  初始化
 *
 *  @return 对象
 */
+ (PRBaiduHttpClient *)DZQClient;

+ (PRBaiduHttpClient *)defaultClient;

/**
 *  设置头
 *
 *  @param parameters 头
 */
- (void)baidu_SetHeaderDesign:(NSDictionary *)parameters manager:(AFHTTPSessionManager *)manager;

/**
 *  HTTP请求（GET、POST、DELETE、PUT）
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
                           success:(void (^)(NSURLSessionDataTask *task, id response))success
                           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                            cancel:(void (^)(void))cancel;

/**
 * GET HTTP请求（ GET JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_GetRequestWithUrl:(NSString *)URLString
                         urlTag:(long)urlTag
                        success:(void (^)(NSURLSessionDataTask *task, id response))success
                        failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                         cancel:(void (^)(void))cancel;

/**
 *  POST HTTP请求（ POST JSON）
 * 一律不加公共上行的请求
 */
- (long)baidu_PostRequestWithUrl:(NSString *)URLString
                          urlTag:(long)urlTag
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, id response))success
                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                          cancel:(void (^)(void))cancel;

/**
 *  HTTP请求（GET、POST、DELETE、PUT）
 *  带有⚠️某些指定的公共上行参数的网络请求
 *  @param URLString    网址
 *  @param urlTag       标记
 *  @param method     RESTFul请求类型
 *  @param reponseType 请求参数
 *  @param parameters 请求参数
 *  @param success    请求成功处理块
 *  @param failure    请求失败处理块
 *  @param cancel     请求取消处理块
 */
- (long)baidu_CommonParametersRequestWithUrl:(NSString *)URLString
                                      urlTag:(long)urlTag
                                      method:(PRRequestType)method
                                 reponseType:(PRResponseType)reponseType
                                  parameters:(id)parameters
                                     success:(void (^)(NSURLSessionDataTask *task, id response))success
                                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                                      cancel:(void (^)(void))cancel;



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
                            cancel:(void (^)(void))cancel;


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

/// 移除当前正在请求的operation
/// @param taskUrlTag taskUrlTag
- (void)baidu_CancelFileTask:(long)taskUrlTag;


/**
 网络状态监测
 */
- (void)baidu_startNetMonitor:(void (^)(AFNetworkReachabilityStatus status))block;


@end








