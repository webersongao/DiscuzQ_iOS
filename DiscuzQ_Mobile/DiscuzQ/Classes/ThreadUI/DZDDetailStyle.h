//
//  DZDDetailStyle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZDListStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZDHeadStyle : DZQStyle

@property (nonatomic, strong) DZDUserStyle *frame_user;  //!< 主题作者
@property (nonatomic, strong) DZDContentStyle *frame_content;  //!< 主题内容区
@property (nonatomic, strong) DZDToolBarStyle *frame_toolBar;  //!< 转评赞 工具条

@property(nonatomic,assign) CGRect kf_head;
@property(nonatomic,assign) CGRect kf_content;
@property(nonatomic,assign) CGRect kf_toolBar;

@property(nonatomic,assign) CGSize kf_HeadSize;

// 计算 空间高度 宽度等
- (instancetype)DHeadStyle:(DZQDataThread *)dataModel cellWidth:(CGFloat)cellWidth maxWidth:(CGFloat)maxWidth;

@end

@interface DZDSectionStyle : DZQStyle

@property(nonatomic,assign) CGRect kf_Line;
@property(nonatomic,assign) CGRect kf_oneList;
@property(nonatomic,assign) CGRect kf_twoList;
@property(nonatomic,assign) CGRect kf_bottomLine;

@property(nonatomic,assign) CGSize kf_SectionSize;

+(instancetype)DSectionStyle:(CGFloat)cellWidth like:(NSInteger)likeCount reward:(NSInteger)rewardCount;

@end


@interface DZDPostCellStyle : DZQStyle

@property (nonatomic, strong) DZDUserStyle *frame_post_user;  //!< 属性注释
@property (nonatomic, strong) DZDContentStyle *frame_post_content;  //!< 主题内容区
@property (nonatomic, strong) DZDToolBarStyle *frame_post_toolBar;  //!< 属性注释

@property(nonatomic,assign) CGRect kf_post_user;
@property(nonatomic,assign) CGRect kf_post_content;
@property(nonatomic,assign) CGRect kf_post_toolBar;

@property(nonatomic,assign) CGFloat kf_post_CellHeight; // 回复cell的高度

// 计算评论内容 frame
+(instancetype)DPostCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataPost *)dataModel;

@end

NS_ASSUME_NONNULL_END
