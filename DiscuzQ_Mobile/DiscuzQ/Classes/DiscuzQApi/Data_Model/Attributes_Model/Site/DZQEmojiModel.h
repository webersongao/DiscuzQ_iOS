//
//  DZQEmojiModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQEmojiModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *url;  //!< 表情所在路径
@property (nonatomic, copy) NSString *code;  //!< 表情码
@property (nonatomic, assign) NSInteger order;  //!< 显示顺序
@property (nonatomic, copy) NSString *category;  //!< 分类

@end


@interface DZQDataEmoji : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQEmojiModel *attributes;    //!< 属性注释

@end
