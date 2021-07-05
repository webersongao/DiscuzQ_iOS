//
//  DZNotificationListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"
#import "DZNotiItem.h"

@interface DZNotificationListView : DZBaseTableView

@property (nonatomic, copy) void(^cellAction)(DZNotiItem *cellModel);  //!< 属性注释

-(void)updateNotiCateList:(NSArray<DZNotiItem *> *)notiArray;



@end


