//
//  DZVideoSquareCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"
#import "DZThreadCellView.h"

@interface DZVideoSquareCell : DZBaseCollectionCell

@property (nonatomic, strong) DZThreadCellView *cellView;  //!< 属性注释

@property (nonatomic, strong,readonly) DZQDataThread *cellModel;  //!< 属性注释

// 更新数据
- (void)updateThreadInnerCell:(DZQDataThread *)Model;

@end

