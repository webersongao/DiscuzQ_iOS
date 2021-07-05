//
//  DZQCateV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/14.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  一条内容分类 Model

#import "DZQSuperModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQCateV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, copy) NSString *name;  //!< 分类名称
@property (nonatomic, copy) NSString *icon;  //!< 分类图标
@property (nonatomic, copy) NSString *cate_description;  //!< 分类说明 (description 字段)

@property (nonatomic, assign) NSInteger sort;  //!< 显示顺序
@property (nonatomic, assign) NSInteger parentid;  //!< 父级 分类id
@property (nonatomic, assign) NSInteger property;  //!< 0:正常 1:首页展示
@property (nonatomic, assign) NSInteger thread_count;  //!< 主题总数

@property (nonatomic, copy) NSString *ip;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间
@property (nonatomic, copy) NSString *updated_at;  //!< 最近更新时间

@property (nonatomic, assign) BOOL canCreateThread;  //!< 是否有权限可以发布主题
@property (nonatomic, assign) NSInteger checked;  //!< 是否为智能排序中被选中的条件，1选中，0未选中
@property (nonatomic, copy) NSString *search_ids;  //!< 当以分类进行搜索时(前端首页、后台内容管理)，前端就取search_ids的值传给对应的搜索接口
@property (nonatomic, strong) NSArray<DZQCateV1 *> *children;  //!< 子类


@end


@interface DZQDataCate : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQCateV1 *attributes;    //!< 属性注释

@end


