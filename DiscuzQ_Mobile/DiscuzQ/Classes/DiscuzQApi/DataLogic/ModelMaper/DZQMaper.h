//
//  DZQMaper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQWrapper.h"

#define KDZQMapKey(X,Y)        [NSString stringWithFormat:@"%@_%@",X,Y]

@interface DZQMaper : NSObject

- (Class)modelClassForKey:(NSString *)typeKey;

/// api 1.0 版本模型
- (Class)relationClassForUrlKey:(NSString *)urlKey;

- (DZQDataConvert *)dataConvertForKey:(NSString *)typeKey;

@end


