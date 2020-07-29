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
@property (nonatomic,strong) UIFont *kf_titleFont;  //!< 字体

@property(nonatomic,assign) CGRect kf_titleFrame;   ///  1、文章的标题title
@property(nonatomic,assign) CGRect kf_contentFrame; ///  2、文字内容
@property(nonatomic,assign) CGRect kf_mediaFrame;   ///  3、图片、视频
@property(nonatomic,assign) CGRect kf_attachFrame;   /// 4、文件附件列表 （单个高度为 kMargin20 ）

@property(nonatomic,assign) CGRect kf_contentMaxRect; // 内容最大rect
@property (nonatomic,strong) DZHtmlItem *kf_contentItem;  //!< 主题内容的格式化对象
@property (nonatomic, strong) DZDGridStyle *kf_squareGrid;  //!< 图片九宫格布局对象

@property(nonatomic,assign) CGFloat kf_ContentHeight;

// 计算 评论内容 frame
+(instancetype)DPostContentStyleWithMaxW:(CGFloat)contenMaxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataPost *)dataModel;


// 计算主题（帖子）内容 frame
+(instancetype)DThreadContentStyleWithMaxW:(CGFloat)maxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataThread *)dataModel isDetail:(BOOL)isDetail;

@end

NS_ASSUME_NONNULL_END
