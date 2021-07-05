//
//  DZThreadListStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  该style 只适用于Home控制器的列表样式

#import "DZQSuperModel.h"
#import "DZDListStyle.h"
#import "DZDDetailStyle.h"

@interface DZThreadListStyle : DZDHeadStyle

@property(nonatomic,assign) CGFloat kf_thread_CellHeight;

@property(nonatomic,strong) NSAttributedString *summaryAttributeStr;

@property (nonatomic, strong) Class className;  //!< 属性注释

@end


