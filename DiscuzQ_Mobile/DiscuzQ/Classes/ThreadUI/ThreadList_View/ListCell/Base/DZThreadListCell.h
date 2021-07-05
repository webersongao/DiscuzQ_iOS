//
//  DZThreadListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZThreadBottomBar.h"
#import "DZThreadListStyle.h"
#import "DZThreadHead.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadListCell : DZBaseTableViewCell

@property (nonatomic, strong) DZThreadHead *userHeader;  //!< 用户信息
@property (nonatomic, strong) DZThreadBottomBar *bottomToolBar;  //!< 转评赞 工具条


-(DZQDataThread *)cellModel;
-(DZThreadListStyle *)cellLayout;

-(void)configThreadCellManager;

// 继承方法
-(void)config_ThreadBaseListCell;

- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
