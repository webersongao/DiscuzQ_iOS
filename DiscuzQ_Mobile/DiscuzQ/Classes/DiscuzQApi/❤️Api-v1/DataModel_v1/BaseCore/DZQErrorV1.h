//
//  DZQErrorV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZQErrorV1Detail : NSObject

@property (nonatomic, copy) NSString *error;  //!< 属性注释
@property (nonatomic, copy) NSString *hint;  //!< 属性注释
@property (nonatomic, copy) NSString *message;  //!< 属性注释
@property (nonatomic, copy) NSString *error_description;  //!< 属性注释

@end

@interface DZQErrorV1Source : NSObject

@property (nonatomic, copy) NSString *pointer;  //!< 属性注释

@end

@interface DZQErrorV1 : NSObject

@property (nonatomic, copy) NSString *code;  //!< 错误信息(英文)
@property (nonatomic, assign) NSInteger status;  //!< 错误状态码
@property (nonatomic, strong) DZQErrorV1Detail *detail;  //!< 错误详情
@property (nonatomic, strong) DZQErrorV1Source *source;  //!< 错误信息
// 自定义字段 兼容 validation_error 注册错误
@property (nonatomic, copy) NSString *errorDetailStr;  //!< 错误信息 格式化解释

@end


@interface DZQResBodyV1 : NSObject

@property (nonatomic, strong) NSArray<DZQErrorV1 *> *errors;  //!< 属性注释

+(DZQResBodyV1 *)ResErrorsWithDict:(NSDictionary *)resErrorDict;


@end

