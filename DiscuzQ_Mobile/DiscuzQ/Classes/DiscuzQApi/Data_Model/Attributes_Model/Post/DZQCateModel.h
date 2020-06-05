//
//  DZQCateModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/14.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  一条内容分类 Model

#import "DZQSuperModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQCateModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *name;  //!< 分类名称
@property (nonatomic, copy) NSString *icon;  //!< 分类图标
@property (nonatomic, copy) NSString *cate_desc;  //!< 分类说明 (description 字段)

@property (nonatomic, assign) NSInteger sort;  //!< 显示顺序
@property (nonatomic, assign) NSInteger property;  //!< 0:正常 1:首页展示
@property (nonatomic, assign) NSInteger thread_count;  //!< 主题总数

@property (nonatomic, copy) NSString *ip;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间
@property (nonatomic, copy) NSString *updated_at;  //!< 最近更新时间

@end


@interface DZQDataCate : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQCateModel *attributes;    //!< 属性注释

@end


