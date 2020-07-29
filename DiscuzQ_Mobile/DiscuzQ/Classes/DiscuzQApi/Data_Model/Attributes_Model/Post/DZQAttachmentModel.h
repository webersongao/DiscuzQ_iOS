//
//  DZQAttachmentModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"


@interface DZQAttachmentModel : DZQSuperAttribute


//    "order": 0,
//    "isGallery": true,
//    "isRemote": false,
//    "isApproved": 0,
//    "url": "https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS.png",
//    "attachment": "nPcasNXDOY7A14TS.png",
//    "extension": "png",
//    "fileName": "Screenshot_2020-02-12-13-05-05-502_微信.png",
//    "filePath": "public/attachment",
//    "fileSize": 132230,
//    "fileType": "image/jpeg",
//    "thumbUrl": "https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS_thumb.png

@property (nonatomic, assign) NSInteger order;  //!< 属性注释
@property (nonatomic, assign) NSInteger type;  //!< 属性注释
@property (nonatomic, assign) NSInteger type_id;  //!< 属性注释

@property (nonatomic, assign) BOOL isGallery;  //!< 是否是帖子图片
@property (nonatomic, assign) BOOL isRemote;  //!< 是否是远程附件
@property (nonatomic, assign) NSInteger isApproved;  //!< 属性注释

@property (nonatomic, copy) NSString *url;  //!< 图片或者视频等附件原始路径
@property (nonatomic, copy) NSString *uuid;  //!< 附件 uuid
@property (nonatomic, copy) NSString *attachment;  //!< 文件系统生成的名称
@property (nonatomic, copy) NSString *extension;  //!< 文件扩展名
@property (nonatomic, copy) NSString *fileName;  //!< 文件原名称
@property (nonatomic, copy) NSString *filePath;  //!< 文件路径
@property (nonatomic, assign) NSTimeInterval fileSize;  //!< 文件大小

@property (nonatomic, copy) NSString *fileType;  //!< 文件类型
@property (nonatomic, copy) NSString *thumbUrl;  //!< 图片缩略图（fileType 为 图片时包含该字段）

@end




@interface DZQDataAttachment: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQAttachmentModel *attributes;    //!< 属性注释


@end
