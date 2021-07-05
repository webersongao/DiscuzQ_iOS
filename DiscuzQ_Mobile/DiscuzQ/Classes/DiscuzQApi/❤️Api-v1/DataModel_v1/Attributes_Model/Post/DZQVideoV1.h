//
//  DZQVideoV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"


@interface DZQVideoV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *thread_id;  //!< 属性注释
@property (nonatomic, assign) NSInteger status;  //!< 视频状态 0:转码中 1 转码完成 2 转码失败
@property (nonatomic, copy) NSString *reason;  //!< 转码失败原因
@property (nonatomic, copy) NSString *file_name;  //!< 属性注释
@property (nonatomic, copy) NSString *file_id;  //!< 媒体文件唯一标识
@property (nonatomic, assign) CGFloat width;  //!< 属性注释
@property (nonatomic, assign) CGFloat height;  //!< 属性注释
@property (nonatomic, assign) float duration;  //!< 音视频时长
@property (nonatomic, copy) NSString *media_url;  //!< 属性注释
@property (nonatomic, copy) NSString *cover_url;  //!< 属性注释
@property (nonatomic, copy) NSString *updated_at;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 属性注释


@end



@interface DZQDataVideo: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQVideoV1 *attributes;    //!< 属性注释

@end
