//
//  DZDListStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

#define KImageWHOneRatio   (9.0/16.0)  // 单张 图片宽高比
#define KImageWHTwoRatio   (4.0/5.0)  // 两张 图片宽高比
#define KVideoWHRatio      (1920.0/1080.0)  // 视频宽高比 1920 / 1080

#define KAudioListHeight   100.0  // 列表 音频高度
#define KGoodsListHeight   150.0 // 列表 商品高度

@interface DZDUserStyle : DZQStyle

// 用户信息展示区（含用户名，昵称，分组 ，置顶，更多 以及 认证标识）

@property(nonatomic,assign) CGRect kf_avatar;
@property(nonatomic,assign) CGRect kf_userTag; // 认证图标
@property(nonatomic,assign) CGRect kf_userName;
@property(nonatomic,assign) CGRect kf_grade; // 用户分组（等级）
@property(nonatomic,assign) CGRect kf_time;
@property(nonatomic,assign) CGRect kf_followBtn;   // 关注 或 加关注图标  （与 kf_time 位置冲突 不可同时显示）
@property(nonatomic,assign) CGRect kf_threadTag;   // 精华还是加精 图标
@property(nonatomic,assign) CGRect kf_postMore;
@property(nonatomic,assign) CGRect kf_bottomLine;  // 可能用到的 分割线

@property (nonatomic, strong) NSAttributedString *nameAttributedString;  //!< 作者名称的富文本显示
@property(nonatomic,assign) CGFloat kf_UserHeight;


/// @param isBasic 为 YES 时 整体偏小
+(instancetype)DUserStyle:(CGFloat)cellWidth basic:(BOOL)isBasic;


@end

@interface DZDGridItemStyle : DZQStyle

@property (nonatomic, assign) CGSize itemSize;  //!< 单元格大小(自由组合)

+(CGSize)DGridItemHeightWithCount:(NSInteger)allCount superWidth:(CGFloat)superWidth;

+(instancetype)DGridItemStyleWithCount:(NSInteger)allCount superWidth:(CGFloat)superWidth;

@end

@interface DZDGridStyle : DZQStyle

@property (nonatomic, assign) CGSize defaultItemSize;  //!< 单元格大小(均等大小)
@property (nonatomic, assign) UIEdgeInsets gridEdge;  //!< 组间距
@property (nonatomic, assign) CGFloat minimumLine;  //!< // 行间距 (上下间隔)
@property (nonatomic, assign) CGFloat minimumInteritem;  //!< // 列间距 (左右间隔)

+(instancetype)DGridImageStyle:(NSArray<DZQDataAttachment *> *)dataImage cellWidth:(CGFloat)cellWidth;

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
