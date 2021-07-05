//
//  DZQGoodsV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQGoodsV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;     //!< 属性注释
@property (nonatomic, copy) NSString *post_id;     //!< 属性注释
@property (nonatomic, copy) NSString *platform_id;     //!< 属性注释
@property (nonatomic, copy) NSString *title;     //!< 属性注释
@property (nonatomic, copy) NSString *image_path;     //!< 属性注释

@property (nonatomic, assign) float price;     //!< 属性注释
//0 淘宝，1 天猫，2 京东，3 拼多多 H5，4 有赞，5 淘宝口令，6 京东 H5，7 有赞粘贴值
@property (nonatomic, assign) NSInteger type;     //!< 平台类型
@property (nonatomic, copy) NSString *type_name;     //!< 平台名称
@property (nonatomic, assign) NSInteger status;     //!< 属性注释
@property (nonatomic, copy) NSString *ready_content;     //!< 属性注释
@property (nonatomic, copy) NSString *detail_content;     //!< 属性注释
@property (nonatomic, copy) NSString *created_at;     //!< 属性注释
@property (nonatomic, copy) NSString *updated_at;     //!< 属性注释

@end


@interface DZQDataGoods : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQGoodsV1 *attributes;    //!< 属性注释

@end

NS_ASSUME_NONNULL_END
