//
//  DZQOriginResV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQOriginResV3 : NSObject

@property (nonatomic, assign) NSInteger Code;  //!< 属性注释

@property (nonatomic, copy) NSString *Message;  //!< 属性注释

@property (nonatomic, assign) BOOL localError;  //!< 数据解析模型化结果

@property (nonatomic, strong) NSArray<NSDictionary *> *Data;  //!< 属性注释

@property (nonatomic, copy) NSString *RequestId;  //!< 属性注释

@property (nonatomic, copy) NSString *RequestTime;  //!< 属性注释


+(instancetype)resV3BaseModelWithJSON:(id)json;

@end

NS_ASSUME_NONNULL_END
