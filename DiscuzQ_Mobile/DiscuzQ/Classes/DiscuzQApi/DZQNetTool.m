//
//  DZQNetTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

@interface DZQNetTool ()

@end

@implementation DZQNetTool

+ (instancetype)shared {
    static DZQNetTool *upTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upTool = [[DZQNetTool alloc] init];
    });
    return upTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _token = @"";
        [self config_DZQHttpClientHeader];
        _dataLogic = [[DZQDataLogic alloc] init];
        _NetClient = [PRBaiduHttpClient DZQClient];
    }
    return self;
}

// 配置请求头
-(void)config_DZQHttpClientHeader{
    
    [_NetClient baidu_SetHeaderDesign:@{@"referer":DZQ_BASEURL} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"user-device":@"iOS_Gao_ApiSDK_V1.0"} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"client-type":@"iOS_Mobile_App"} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"user-agent":@"iOS_Gao_MobileClient"} manager:_NetClient.jsonManager];
    
}

-(PRBaiduHttpClient *)NetClient{
    NSString *authorization = [NSString stringWithFormat:@"Bearer %@",self.token];
    if (self.token.length) {
        KSLog(@"WBS Toekn 是 \n\n %@  \n\n",self.token);
        [_NetClient baidu_SetHeaderDesign:@{@"authorization":authorization} manager:_NetClient.jsonManager];
    }else{
        KSLog(@"账户未登录，无法获取到 Token 值");
    }
    return _NetClient;
}

-(void)updateDZQSDkToken:(NSString *)token{
    _token = checkNull(token);
}

/*
 *  清除缓存信息
 */
- (void)cleanUplogicCacheWithCompletion:(void (^)(void))completion{
    
    [self.dataLogic cleanCacheWithBlock:completion];
    
}

@end
















