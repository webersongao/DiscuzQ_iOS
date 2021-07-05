//
//  DZQBaseV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZQDataIdV1 : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) id attributes;  //!< 根据 type 确定 attributes 的model类型
//@property (nonatomic, strong) id relationships;  //!< 属性注释

@end

@interface DZQDataV1 : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *attributes;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *relationships;  //!< 属性注释

@end


@interface DZQLinkV1 : NSObject
@property (nonatomic, copy) NSString *first;  //!< 属性注释
@property (nonatomic, copy) NSString *prev;  //!< 属性注释
@property (nonatomic, copy) NSString *next;  //!< 属性注释
@property (nonatomic, copy) NSString *last;  //!< 属性注释
@end

@interface DZQMetaV1 : NSObject
// 默认是一页20条
// meta    非基础数据，其它自定义数据
@property (nonatomic, assign) NSInteger pageCount;  //!< 总页数
@property (nonatomic, assign) NSInteger threadCount;  //!< 总数量

@end


