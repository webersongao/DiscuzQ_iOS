//
//  DZQResModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQBaseRes.h"
#import "DZQBaseRelate.h"
#import "DZQSuperModel.h"

#pragma mark   /********** 第一层 ***************/

@interface DZQBodyModel : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQSuperAttribute *attributes;  //!< 子类实现 父类
@property (nonatomic, strong) DZQSuperRelation *relationships;  //!< 子类实现 父类

-(id)DZQDataModel;

@end

@interface DZQResError : NSObject

@property (nonatomic, copy) NSString *errorMsg;  //!< 对应 原始的 code 字段
@property (nonatomic, assign) NSInteger status;  //!< 属性注释
@property (nonatomic, strong) NSArray<NSString *> *errorDetail;  //!< 错误信息详情

+(instancetype)localResError:(DZQErrorModel *)netError json:(id)json;

@end


@interface DZQResModel : NSObject

// 自定义字段（综合分析了 errors 和 data 之后的结论）
@property (nonatomic, assign) BOOL success;  //!< 返回数据是否可用

// 自定义字段（综合分析了 links中的first和last 以及 meta之后的结论）
@property (nonatomic, assign) BOOL hasMore;  //!< 是否还有更多数据

// 自定义字段（结构化的错误信息 综合分析处理了 errors 字段）
@property (nonatomic, strong) DZQResError *resError;  //!< 接口错误信息

// 自定义字段(dataBody 合并了 data 和 included 字段数据)
@property (nonatomic, strong) NSArray<DZQBodyModel *> *dataBody;  //!< 核心模型化数据

@property (nonatomic, strong) DZQBaseRes *oriRes_formart;  //!< 网络返回的原始数据（已经格式化过了）

@property (nonatomic, strong) NSDictionary *oriRes_dictionary;  //!< 网络返回的原始数据（没有格式化）


@end
