//
//  DZQMacroHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#ifndef DZQMacro_h
#define DZQMacro_h
#import "DZToolBox.h"
#import "DZQV1Header.h"
#import "DZQV3Header.h"
#import "DZQDataLogic.h"
#import "PRBaiduHttpClient.h"

typedef void(^PRNoneBlock)(void);
typedef void(^PRBoolBlock)(BOOL *success);
typedef void(^PRFailureBlock)(DZQResError *error);
typedef void(^PRCompleteBlock)(id data,BOOL success);
typedef void(^PRProgressBlock)(double Progress);


// 客户端URL识别码

#define DZQ_Client     @"ios_gao_client"
#define DZQ_from_TAG   [NSString stringWithFormat:@"from=%@",DZQ_Client]


// =========   宏配置   =======

#define DZQStrNull(__X__)        (__X__) == nil || [(__X__) isEqual:[NSNull null]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

#define DZQTwoStr(X,Y)        [NSString stringWithFormat:@"%@%@",X,Y]
#define DZQInteger(__X__)     [NSString stringWithFormat:@"%ld",__X__]
#define DZQTwoErrorStr(X,Y)   [NSString stringWithFormat:@"%@-%@",X,Y]

#define DZQWEAKSELF __weak typeof(self) weakQSelf = self;

#define DZQError(_domain, _code, _desc) [NSError errorWithDomain:(_domain) code:(_code) userInfo:@{NSLocalizedDescriptionKey : ((_desc).length ? (_desc) : KError_DataNil)}]

#define DZQFailureError(_domain, _code, _desc)   DZQError(DZQStrNull(_domain), _code, DZQStrNull(_desc))














#endif /* DZQMacro_h */
