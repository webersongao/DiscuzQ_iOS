//
//  DZQMacroHeader.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#ifndef DZQMacro_h
#define DZQMacro_h


// tabbar个人中心选中

#define DZQ_Client     @"ios_gao_client"
#define DZQ_from_TAG   [NSString stringWithFormat:@"from=%@",DZQ_Client]


// =========   宏配置   =======

#define DZQStrNull(__X__)        (__X__) == nil || [(__X__) isEqual:[NSNull null]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

#define DZQTwoStr(X,Y)        [NSString stringWithFormat:@"%@%@",X,Y]
#define DZQInteger(__X__)     [NSString stringWithFormat:@"%ld",__X__]

#define DZQWEAKSELF __weak typeof(self) weakQSelf = self;

#define DZQError(_domain, _code, _desc) [NSError errorWithDomain:(_domain) code:(_code) userInfo:@{NSLocalizedDescriptionKey : ((_desc).length ? (_desc) : KError_DataNil)}]

#define DZQFailureError(_domain, _code, _desc)   DZQError(DZQStrNull(_domain), _code, DZQStrNull(_desc))














#endif /* DZQMacro_h */
