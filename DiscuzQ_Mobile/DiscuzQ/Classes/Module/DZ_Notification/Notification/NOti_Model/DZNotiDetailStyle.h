//
//  DZNotiDetailStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDContentStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNotiDetailStyle : DZDContentStyle


@property (nonatomic,copy) NSString *kf_timeString;  //!< 通知内容的 发布时间 格式化显示
@property (nonatomic, strong) DZDUserStyle *frame_Noti_user;  //!< 顶部用户信息 布局样式


// 计算 通知 内容 frame
+(instancetype)DNotiDetailStyleWithCellWidth:(CGFloat)cellWidth dataModel:(DZQDataNoti *)dataModel;

@end

NS_ASSUME_NONNULL_END
