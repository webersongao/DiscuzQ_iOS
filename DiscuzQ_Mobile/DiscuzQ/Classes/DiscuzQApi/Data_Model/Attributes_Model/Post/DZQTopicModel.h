//
//  DZQTopicModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQTopicRelationModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQTopicModel : DZQSuperAttribute


@property (nonatomic, copy) NSString *user_id;  //!< 创建人 user_id
@property (nonatomic, copy) NSString *content;  //!< 话题内容

@property (nonatomic, assign) NSInteger thread_count;  //!< 主题数
@property (nonatomic, assign) NSInteger view_count;  //!< 浏览数

@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间

@end


@interface DZQDataTopic: DZQSuperData


@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQTopicModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQTopicRelationModel *relationships;    //!< 属性注释

@end
