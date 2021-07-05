//
//  DZUserResModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQBaseV1.h"

@interface DZQOriginResV1 : NSObject

// data 字段在部分接口不是数组 YY重写，转为数组
@property (nonatomic, strong) NSArray<NSDictionary *> *data;  //!< 通用字段
@property (nonatomic, strong) NSArray<NSDictionary *> *included;  //!< 关联数据

@property (nonatomic, strong) DZQLinkV1 *links;  //!< 页码链接
@property (nonatomic, strong) DZQMetaV1 *meta;  //!< 自定义数据


+(instancetype)resBaseModelWithJSON:(id)json;



@end




