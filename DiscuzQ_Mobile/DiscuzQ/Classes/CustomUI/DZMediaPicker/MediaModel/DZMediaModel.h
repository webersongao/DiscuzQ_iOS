//
//  DZMediaModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    DZMedia_none,  //  空白占位图 (加号)
    DZMedia_gif,    // gif动画
    DZMedia_image,  // 图片
    DZMedia_file,   // 文件
    DZMedia_video,  // 视频
    DZMedia_audio,  // 音频
} DZMediaType;

@interface DZMediaModel : NSObject

@property (nonatomic, weak) UIView *preview;  //!< 属性注释

@property (nonatomic, copy) NSString *mediaPath;  //!< 媒体文件地址

@property (nonatomic, copy) NSString *thumbPath;  //!< 媒体预览图

@property (nonatomic, copy) NSString *mediaName;  //!< 文件名

@property (nonatomic, copy) NSString *mediaTypeStr;  //!< 文件类型名称

@property (nonatomic, assign) double durationTime;  //!< 时长（音视频 独有）

@property (nonatomic, assign) DZMediaType mediaType;  //!< 属性注释


- (instancetype)imageDataWith:(NSString *)url preview:(UIView *)preView;


+(NSArray *)convertAttachData:(NSArray<DZQDataAttachment *> *)attachDataArray;






+(instancetype)placeHolderMedia;

@end

NS_ASSUME_NONNULL_END
