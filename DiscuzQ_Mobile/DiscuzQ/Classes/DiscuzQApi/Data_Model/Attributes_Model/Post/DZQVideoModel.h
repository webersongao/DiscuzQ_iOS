//
//  DZQVideoModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"


@interface DZQVideoModel : DZQSuperAttribute


@property (nonatomic, copy) NSString *video_id;  //!< 属性注释
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *thread_id;  //!< 属性注释
@property (nonatomic, assign) NSInteger status;  //!< 属性注释
@property (nonatomic, copy) NSString *reason;  //!< 属性注释
@property (nonatomic, copy) NSString *file_name;  //!< 属性注释
@property (nonatomic, copy) NSString *file_id;  //!< 属性注释
@property (nonatomic, copy) NSString *cover_url;  //!< 属性注释
@property (nonatomic, copy) NSString *updated_at;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 属性注释


@end



@interface DZQDataVideo: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQVideoModel *attributes;    //!< 属性注释

@end
