//
//  DZQBaseModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZQDataIdModel : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) id attributes;  //!< 根据 type 确定 attributes 的model类型
//@property (nonatomic, strong) id relationships;  //!< 属性注释

@end

@interface DZQDataModel : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *attributes;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *relationships;  //!< 属性注释

@end


@interface DZQLinkModel : NSObject
@property (nonatomic, copy) NSString *first;  //!< 属性注释
@property (nonatomic, copy) NSString *prev;  //!< 属性注释
@property (nonatomic, copy) NSString *next;  //!< 属性注释
@property (nonatomic, copy) NSString *last;  //!< 属性注释
@end

@interface DZQMetaModel : NSObject
// 默认是一页20条
// meta    非基础数据，其它自定义数据
@property (nonatomic, assign) NSInteger pageCount;  //!< 总页数
@property (nonatomic, assign) NSInteger threadCount;  //!< 总数量

@end

@interface DZQErrtailModel : NSObject

@property (nonatomic, copy) NSString *error;  //!< 属性注释
@property (nonatomic, copy) NSString *hint;  //!< 属性注释
@property (nonatomic, copy) NSString *message;  //!< 属性注释
@property (nonatomic, copy) NSString *error_description;  //!< 属性注释

@end

@interface DZQErrorModel : NSObject

@property (nonatomic, copy) NSString *code;  //!< 错误信息
@property (nonatomic, assign) NSInteger status;  //!< 错误状态码
@property (nonatomic, strong) NSDictionary *source;  //!< 错误信息
@property (nonatomic, strong) DZQErrtailModel *detail;  //!< 错误详情
// 用户注册时发生的validation_error 特殊情况
@property (nonatomic, strong) NSArray<NSString *> *regDetail;  //!< 用户注册 错误信息

@end

