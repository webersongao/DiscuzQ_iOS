//
//  DZUserResModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQBaseModel.h"

@interface DZQBaseRes : NSObject

// data 字段在部分接口不是数组 YY重写，转为数组
@property (nonatomic, strong) NSArray<NSDictionary *> *data;  //!< 通用字段
@property (nonatomic, strong) NSArray<NSDictionary *> *included;  //!< 关联数据

@property (nonatomic, strong) DZQLinkModel *links;  //!< 页码链接
@property (nonatomic, strong) DZQMetaModel *meta;  //!< 自定义数据

// 如果接口错误 返回的错误信息
@property (nonatomic, strong) NSArray<DZQErrorModel *> *errors;  //!< 错误信息


+(instancetype)resBaseModelWithJSON:(id)json;



@end




