//
//  DZNotificationListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"
#import "DZNotiItem.h"

@interface DZNotificationListView : DZBaseTableView

@property (nonatomic, copy) void(^cellAction)(DZNotiItem *cellModel);  //!< 属性注释

-(void)updateMessageList:(NSArray<DZNotiItem *> *)notiArray;



@end


