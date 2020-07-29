//
//  DZSearchHistoryController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/11.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseTableController.h"

@interface DZSearchHistoryController : DZBaseTableController
@property (nonatomic, copy) void(^SearchClick)(NSString *searchText);
@property (nonatomic, copy) void(^ScrollWillDrag)(void);
- (void)saveSearchHistory:(NSString *)searchText;
@end
