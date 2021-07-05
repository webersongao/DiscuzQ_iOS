//
//  PRBaiduManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRBaiduHeader.h"
#import "PRBaiduSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PRBaiduManager : NSObject

+ (PRBaiduManager *)DZQConfig;

- (PRBaiduSessionManager *)baidu_jsonConfigManager;

- (PRBaiduSessionManager *)baidu_dataConfigManager;

//避免多线程访问导致返回数据格式不对,所以分三大类请求都分配一类manager
- (PRBaiduSessionManager *)baidu_ManagerWithResType:(PRResponseType)reponseType;



@end

NS_ASSUME_NONNULL_END
