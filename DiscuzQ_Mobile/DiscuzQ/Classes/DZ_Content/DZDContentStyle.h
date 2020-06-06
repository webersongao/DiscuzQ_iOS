//
//  DZDContentStyle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZHtmlItem.h"
#import "DZDListStyle.h"


NS_ASSUME_NONNULL_BEGIN

@interface DZDContentStyle : DZQStyle

// 主题内容区（主题核心内容展示区域 文字 ，图片 ，视频等）
@property (nonatomic,strong) UIFont *kf_oneFont;  //!< 字体
@property(nonatomic,assign) CGRect kf_oneFrame; /// title 或者图片视频等
@property(nonatomic,assign) CGRect kf_twoFrame; //  文字内容
@property(nonatomic,assign) CGRect kf_twoMaxRect; // 内容最大rect
@property (nonatomic,strong) DZHtmlItem *kf_twoItem;  //!< 主题内容的格式化对象

@property (nonatomic, strong) DZDGridStyle *kf_squareGrid;  //!< 图片九宫格布局对象

@property(nonatomic,assign) CGFloat kf_ContentHeight;

// 计算评论内容 frame
+(instancetype)DPostContentStyleWithMaxW:(CGFloat)contenMaxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataPost *)dataModel;
// 计算主题（帖子）内容 frame
+(instancetype)DThreadContentStyleWithMaxW:(CGFloat)contenMaxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataThread *)dataModel;

@end

NS_ASSUME_NONNULL_END
