//
//  DZQMaper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQWrapper.h"

#define KDZQMapKey(X,Y)        [NSString stringWithFormat:@"%@_%@",X,Y]

@interface DZQMaper : NSObject

- (Class)modelClassForKey:(NSString *)typeKey;

- (Class)relationClassForUrlKey:(NSString *)urlKey;

- (DZQDataConvert *)dataConvertForKey:(NSString *)typeKey;

@end


