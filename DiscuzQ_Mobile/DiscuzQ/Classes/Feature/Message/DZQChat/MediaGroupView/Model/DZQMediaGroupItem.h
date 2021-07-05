//
//  DZQMediaGroupItem.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/11/8.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>


// 展示图类型
typedef NS_ENUM(NSInteger, DZQImageGroupType) {
    DZQImageGroupImage = 1, // 图片
    DZQImageGroupGif = 2, // Gif图片
    DZQImageGroupVideo,  // 短视频
};

// 图片展示状态
typedef NS_ENUM(NSInteger, DZQImageShowType) {
    DZQImageShowValue1 = 1,  // 未展示
    DZQImageShowValue2,  // 放大展示
    DZQImageShowValue3, // 滚动展示
    DZQImageShowValue4,  // 滚动隐藏
};

/**
 图片视图的cell 适用于 gif和普通图片
 */
@interface DZQMediaGroupItem : NSObject

//图类型
@property(nonatomic,assign)DZQImageGroupType   imageType;

//需要展示的图片/gif图片数组 图片视图
@property(nonatomic,strong)UIImage      *fromImage;
@property(nonatomic,strong)NSArray      *fromImages;
@property(nonatomic,strong)UIImageView  *fromImgView;

//图片格式
@property (nonatomic, assign) UIViewContentMode contentMode;

//短视频路径
@property(nonatomic,strong)NSString *videoPath;

//标签
@property(nonatomic,assign)NSInteger  itemTag;


@end


