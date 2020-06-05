//
//  DZVideoSquareCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"
#import "DZThreadBaseView.h"

@interface DZVideoSquareCell : DZBaseCollectionCell

@property (nonatomic, strong) DZThreadBaseView *cellView;  //!< 属性注释

@property (nonatomic, strong,readonly) DZQDataThread *cellModel;  //!< 属性注释

// 更新数据
- (void)updateThreadInnerCell:(DZQDataThread *)Model;

@end

