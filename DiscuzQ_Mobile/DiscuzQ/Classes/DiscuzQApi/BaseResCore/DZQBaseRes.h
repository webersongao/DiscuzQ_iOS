//
//  DZQBaseRes.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQBaseRes : NSObject

// 自定义字段（综合分析了 errors 和 data 之后的结论）
@property (nonatomic, assign, readonly) BOOL success;  //!< 返回数据是否可用

// 自定义字段（综合分析了 links中的first和last 以及 meta之后的结论）
@property (nonatomic, assign, readonly) BOOL hasMore;  //!< 是否还有更多数据


-(void)setResSuccess:(BOOL)success;

-(void)setResHasMore:(BOOL)hasMore;

@end

NS_ASSUME_NONNULL_END
