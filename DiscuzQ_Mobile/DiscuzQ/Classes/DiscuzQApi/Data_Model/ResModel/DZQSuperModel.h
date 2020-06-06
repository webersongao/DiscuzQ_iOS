//
//  DZQSuperModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQDataConvert.h"
#import "DZQBaseModel.h"
#import "NSObject+Super.h"

// 无特殊情况，一般都是屏幕宽度
#define dz_CellWidth KScreenWidth
// 无特殊情况，一般都是屏幕宽度 - 30 （两个边距）
#define dz_CellMaxContentWidth ((KScreenWidth) - kMargin30)

@class DZQSuperData;

@interface DZQStyle : NSObject
/// 存放一些基本的布局 和 格式化数据参数
+(DZQStyle *)inner_dataStyle:(DZQSuperData *)dataModel;

@end

@interface DZQSuperData : NSObject

@property (nonatomic,strong) DZQStyle *styleModel; //通用样式model

@end

// 仅做抽象父类,对应 data中的 data.Attributes 字段
@interface DZQSuperAttribute : NSObject


@end

// 仅做抽象父类,对应Data中的 data.relationships 字段
// 该 子类 的字段只能是 data.relationships 的一级字段 暂不支持自定义key
@interface DZQSuperRelation : NSObject

+ (Class)relateClassForKey:(NSString *)typeKey;

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary;

@end

