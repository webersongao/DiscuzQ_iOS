//
//  DZQDataConvert.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DZQBodyV1;
@class DZQSuperAttribute;
@class DZQSuperRelation;

@interface DZQDataConvert : NSObject

/// 外面统一调用 处理显示布局的方法
/// @param dataBody 格式化的 模型数据
-(void)convertResponseDataBody:(NSArray<DZQBodyV1 *> *)dataBody;



// 子类继承 用来创建布局对象
- (BOOL)handleDataAttribute:(DZQSuperAttribute *)attribute relationship:(DZQSuperRelation *)relationship;



@end


