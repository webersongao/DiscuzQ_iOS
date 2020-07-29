//
//  DZAttachGridCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"

typedef enum : NSUInteger {
    DZAttach_None,  // 默认为加号
    DZAttach_Pic,  // 图片
    DZAttach_File,  // 文件
    DZAttach_Video, // 视频
    DZAttach_Audio, // 音频
} DZAttachMode;

@interface DZAttachGridCell : DZBaseCollectionCell

@property (nonatomic, strong) id fileAsset;

@property (nonatomic, assign) DZAttachMode fileMode;  //!< 属性注释


@end


