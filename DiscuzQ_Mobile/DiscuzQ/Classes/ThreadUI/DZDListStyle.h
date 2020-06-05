//
//  DZDListStyle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZHtmlItem.h"

@interface DZDUserStyle : DZQStyle

// 用户信息展示区（含用户名，昵称，分组 ，置顶，更多 以及 认证标识）

@property(nonatomic,assign) CGRect kf_avatar;
@property(nonatomic,assign) CGRect kf_userTag; // 认证图标
@property(nonatomic,assign) CGRect kf_userName;
@property(nonatomic,assign) CGRect kf_grade; // 用户分组（等级）
@property(nonatomic,assign) CGRect kf_time;
@property(nonatomic,assign) CGRect kf_threadTag;
@property(nonatomic,assign) CGRect kf_postMore;
@property(nonatomic,assign) CGRect kf_bottomLine;  // 可能用到的 分割线


@property(nonatomic,assign) CGFloat kf_UserHeight;


/// @param isBasic 为 YES 时 整体偏小
+(instancetype)DUserStyle:(CGFloat)cellWidth basic:(BOOL)isBasic;


@end

@interface DZDGridStyle : DZQStyle

@property (nonatomic, assign) CGSize itemSize;  //!< 单元格大小
@property (nonatomic, assign) UIEdgeInsets gridEdge;  //!< 组间距
@property (nonatomic, assign) CGFloat minimumLine;  //!< // 行间距 (上下间隔)
@property (nonatomic, assign) CGFloat minimumInteritem;  //!< // 列间距 (左右间隔)

+(instancetype)DGridImageStyle:(NSInteger)thumCount;

@end


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
+(instancetype)DPostContentStyleWithMaxW:(CGFloat)contenMaxWidth dataModel:(DZQDataPost *)dataModel;
// 计算主题（帖子）内容 frame
+(instancetype)DThreadContentStyleWithMaxW:(CGFloat)contenMaxWidth dataModel:(DZQDataThread *)dataModel;

@end


@interface DZDToolBarStyle : DZQStyle

/// 列表页 转评赞 工具条 （）
@property(nonatomic,assign) CGRect kf_left;
@property(nonatomic,assign) CGRect kf_center;
@property(nonatomic,assign) CGRect kf_right;
@property(nonatomic,assign) CGRect kf_barLine;

@property(nonatomic,assign) CGFloat kf_ToolBarHeight;

+(instancetype)DToolBarStyle:(CGFloat)cellWidth;

@end
