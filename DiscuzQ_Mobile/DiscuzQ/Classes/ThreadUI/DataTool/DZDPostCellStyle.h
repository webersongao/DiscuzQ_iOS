//
//  DZDPostCellStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZDListStyle.h"
#import "DZDContentStyle.h"
NS_ASSUME_NONNULL_BEGIN

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
