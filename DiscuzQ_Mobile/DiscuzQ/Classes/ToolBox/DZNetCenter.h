//
//  DZNetCenter.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQAPIHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter : NSObject

@property(nonatomic,strong) dispatch_queue_t formartQueue;

+ (instancetype)center;

@end

NS_ASSUME_NONNULL_END
