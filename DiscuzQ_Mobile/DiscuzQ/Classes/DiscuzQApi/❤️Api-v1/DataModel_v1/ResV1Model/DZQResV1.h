//
//  DZQResV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRError.h"
#import "DZQBaseRes.h"
#import "DZQOriginResV1.h"
#import "DZQErrorV1.h"
#import "DZQBaseRelate.h"
#import "DZQSuperModel.h"

@class DZQMaper;
#pragma mark   /********** 成功信息 ***************/

@interface DZQBodyV1 : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQSuperAttribute *attributes;  //!< 子类实现 父类
@property (nonatomic, strong) DZQSuperRelation *relationships;  //!< 子类实现 父类

@end

@interface DZQResError : NSObject

@property (nonatomic, strong) NSError *ori_error;  //!< 属性注释
@property (nonatomic, strong) DZQResBodyV1 *errorBody;  //!< 完全模型化的错误信息
@property (nonatomic, strong) NSDictionary *ori_errorRes;  //!< 属性注释

+(DZQResError *)errorBodyWithError:(PRError *)oriError;


@end


@interface DZQResV1 : DZQBaseRes

// 自定义字段(dataBody 合并了 data 和 included 字段数据)
@property (nonatomic, strong, readonly) NSArray<DZQBodyV1 *> *dataBody;  //!< 核心模型化数据

// 请求失败 错误信息
@property (nonatomic, strong, readonly) DZQResError *errorBody;  //!< 核心模型化数据

@property (nonatomic, strong, readonly) DZQOriginResV1 *oriRes_formart;  //!< 网络返回的原始数据（已经格式化过了）

@property (nonatomic, strong, readonly) NSDictionary *oriRes_dictionary;  //!< 网络返回的原始数据（没有格式化）


+(DZQResV1 *)revert_convertWithOriRes:(DZQOriginResV1 *)res_formartModel oriJSON:(id)json urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper;

+(NSArray *)three_innerConvertWithJSON:(NSArray<NSDictionary *> *)resModel_data urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper;

@end

