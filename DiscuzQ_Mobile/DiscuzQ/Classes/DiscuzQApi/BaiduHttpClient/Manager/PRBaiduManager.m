//
//  PRBaiduManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "PRBaiduManager.h"

@interface PRBaiduManager ()

@property(nonatomic,strong) PRBaiduSessionManager *jsonSessionManager;
@property(nonatomic,strong) PRBaiduSessionManager *dataSessionManager;


@end

@implementation PRBaiduManager

+ (PRBaiduManager *)DZQConfig
{
    static PRBaiduManager *BDIstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        BDIstance = [[self alloc] init];
    });
    return BDIstance;
}

- (PRBaiduSessionManager *)baidu_jsonConfigManager{
    return self.jsonSessionManager;
}

- (PRBaiduSessionManager *)baidu_dataConfigManager{
    return self.dataSessionManager;
}

/// ++++++++++++=======  通用配置项  ========++++++++++++

- (PRBaiduSessionManager *)jsonSessionManager
{
    if (!_jsonSessionManager) {
        _jsonSessionManager = [PRBaiduSessionManager manager];
        _jsonSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _jsonSessionManager.requestSerializer.timeoutInterval = Baidu_REQUEST_TIME;
        _jsonSessionManager.responseSerializer = [self baidu_resSerializerType:PRResponseJson];
    }
    return _jsonSessionManager;
}

- (PRBaiduSessionManager *)dataSessionManager
{
    if (!_dataSessionManager) {
        _dataSessionManager = [PRBaiduSessionManager manager];
        _dataSessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _dataSessionManager.requestSerializer.timeoutInterval = Baidu_REQUEST_TIME;
        _dataSessionManager.responseSerializer = [self baidu_resSerializerType:PRResponseData];
    }
    return _dataSessionManager;
}

//避免多线程访问导致返回数据格式不对,所以分三大类请求都分配一类manager
- (PRBaiduSessionManager *)baidu_ManagerWithResType:(PRResponseType)reponseType
{
    PRBaiduSessionManager *_manager;
    switch (reponseType) {
        case PRResponseJson:
            _manager = self.jsonSessionManager;
            break;
        case PRResponseData:
            _manager = self.dataSessionManager;
            break;
    }
    return _manager;
}



//响应数据类型
- (AFHTTPResponseSerializer *)baidu_resSerializerType:(PRResponseType)type
{
    if (type == PRResponseJson){
        
        AFJSONResponseSerializer *jsonSerializer = [AFJSONResponseSerializer serializer];
        jsonSerializer.removesKeysWithNullValues = YES;
        jsonSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/vnd.api+json",@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
        
        return jsonSerializer;
    }
    
    return [AFHTTPResponseSerializer serializer];
}



@end
