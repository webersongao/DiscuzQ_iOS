//
//  PRError.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PRError : NSError

@property (nonatomic, strong, readonly) NSError *error;  //!< 属性注释
@property (nonatomic, strong, readonly) NSDictionary *resDictionary;  //!< 属性注释


+(instancetype)PRRrror:(NSError *)error;

+(instancetype)PRRrror:(NSError *)error response:(id)responseObj;




@end

NS_ASSUME_NONNULL_END
