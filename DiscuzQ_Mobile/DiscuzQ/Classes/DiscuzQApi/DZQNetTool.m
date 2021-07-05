//
//  DZQNetTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZQNetTool_Private.h"
#import "DZQTokenV1.h"

@interface DZQNetTool ()

@property (nonatomic, strong) DZQTokenV1 *token;  //!< 用户Token
@property (nonatomic, strong) DZQDataLogic *dataLogic;  //!< 相应数据格式化
@property (nonatomic, strong) DZErrorFormarter *formarter;  /// 字段格式化
@property (nonatomic, strong) PRBaiduHttpClient *NetClient;  //!< 网络请求类

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
        _token = nil;
        _dataLogic = [[DZQDataLogic alloc] init];
        _NetClient = [PRBaiduHttpClient DZQClient];
        _formarter = [[DZErrorFormarter alloc] init];
        [self localConfig_DZQHttpClientHeader];
    }
    return self;
}

// 配置请求头
-(void)localConfig_DZQHttpClientHeader{
    
    [_NetClient baidu_SetHeaderDesign:@{@"referer":[DZMobileCtrl siteRootDomain]} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"user-device":DZQTwoStr(@"iOS_Gao_ApiSDK_%@", DZQInteger(self.version))} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"client-type":@"iOS_Mobile_App"} manager:_NetClient.jsonManager];
    [_NetClient baidu_SetHeaderDesign:@{@"user-agent":@"iOS_Gao_MobileClient"} manager:_NetClient.jsonManager];
    
}

-(PRBaiduHttpClient *)NetClient{
    NSString *token_type = self.token.token_type.length ? self.token.token_type : @"Bearer";
    NSString *authorization = [NSString stringWithFormat:@"%@ %@",token_type,DZQStrNull(self.token.access_token)];
    if (self.token && !self.token.isExpired) {
//        KSLog(@"WBS Toekn 是 \n\n %@  \n\n",self.token.access_token);
        [_NetClient baidu_SetHeaderDesign:@{@"authorization":authorization} manager:_NetClient.jsonManager];
    }else{
        KSLog(@"账户未登录，无法获取到 Token 值");
    }
    return _NetClient;
}

- (BOOL)tokenExpired{
    return self.token.isExpired;
}

-(void)updateSDKVersion:(NSInteger)version{
    _version = version;
    [self.dataLogic updateLogicVersion:version];
}

-(void)updateDZQSDKToken:(DZQTokenV1 *)tokenModel{
    _token = tokenModel;
}

/// 退出登录
-(void)DZQ_LoginOutWithCompletion:(PRNoneBlock)completion{
    
    [self updateDZQSDKToken:nil];
    [self.NetClient baidu_SetHeaderDesign:@{@"authorization":@""} manager:self.NetClient.jsonManager];
    
    if (completion) { completion(); }
    
}

/// 清除缓存信息
- (void)cleanUplogicCacheWithCompletion:(void (^)(void))completion{
    
    [self.dataLogic cleanCacheWithBlock:completion];
}

@end
















