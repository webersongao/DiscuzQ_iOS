//
//  DZInstance.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  存放各种单例属性

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZInstance : NSObject

@property (nonatomic, strong) NSDateFormatter *dateFormatter;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
