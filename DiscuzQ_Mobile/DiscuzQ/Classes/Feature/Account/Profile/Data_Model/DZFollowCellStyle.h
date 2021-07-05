//
//  DZFollowCellStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZDListStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZFollowCellStyle : DZQStyle

@property (nonatomic, strong) DZDUserStyle *frame_Follow_user;  //!< 属性注释

@property(nonatomic,assign) CGRect kf_Follow_user;

@property(nonatomic,assign) CGFloat kf_Follow_CellHeight; // 关注者cell的高度

// 计算评论内容 frame
+(instancetype)DFollowCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataFollow *)dataModel;


@end

NS_ASSUME_NONNULL_END
