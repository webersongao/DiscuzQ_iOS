//
//  DZDiaLogStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZHtmlItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZDiaLogStyle : DZQStyle


@property (nonatomic, assign) CGRect kf_icon;  //!< 属性注释
@property (nonatomic, assign) CGRect kf_title;  //!< 属性注释
@property (nonatomic, assign) CGRect kf_content;  //!< 属性注释
@property (nonatomic, assign) CGRect kf_time;  //!< 属性注释
@property (nonatomic, assign) CGRect kf_number;  //!< 属性注释
@property (nonatomic, assign) CGRect kf_bottomLine;  //!< 属性注释

@property (nonatomic, copy) NSString *kf_timeString;  //!< 时间
@property (nonatomic, assign) CGFloat kf_cellHeight;  //!< 属性注释

@property (nonatomic, assign) CGRect kf_diaCellMaxRect;  //!< 属性注释
@property (nonatomic, strong) DZHtmlItem *kf_diaContentItem;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
