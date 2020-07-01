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

//@property (nonatomic, assign) BOOL isGallery;  //!< 属性注释
@property (nonatomic, assign) BOOL isRemote;  //!< 属性注释
@property (nonatomic, assign) NSInteger isApproved;  //!< 属性注释

@property (nonatomic, copy) NSString *url;  //!< 属性注释
@property (nonatomic, copy) NSString *attachment;  //!< 属性注释
@property (nonatomic, copy) NSString *extension;  //!< 属性注释
@property (nonatomic, copy) NSString *fileName;  //!< 属性注释
@property (nonatomic, copy) NSString *filePath;  //!< 属性注释
@property (nonatomic, assign) NSTimeInterval fileSize;  //!< 属性注释

@property (nonatomic, copy) NSString *fileType;  //!< 属性注释
@property (nonatomic, copy) NSString *thumbUrl;  //!< 图片缩略图（fileType 为 图片时包含该字段）

@end




@interface DZQDataAttachment: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQAttachmentModel *attributes;    //!< 属性注释


@end
