//
//  PRBaiduHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#ifndef PRBaiduHeader_h
#define PRBaiduHeader_h

static double Baidu_REQUEST_TIME = 30.0;

static NSInteger Baidu_CANCEL_CODE = -999; //取消网络
static NSInteger Baidu_NONENET_CODE = -1009; // 没网
static NSInteger Baidu_ERRORNET_CODE = -1001; //网不正常上不去

typedef NS_ENUM(NSInteger, PRRequestType){
    PRRequestGet,
    PRRequestPut,
    PRRequestHead,
    PRRequestPost,
    PRRequestPatch,
    PRRequestDelete,
};

typedef NS_ENUM(NSInteger, PRResponseType){
    PRResponseJson,
    PRResponseData,
};


#endif /* PRBaiduHeader_h */
