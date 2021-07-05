//
//  DZSettingListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSettingListView : DZBaseTableView

- (instancetype)initSettingFrame:(CGRect)frame;

-(void)updateSettingList:(NSArray *)dataArray;


@end

NS_ASSUME_NONNULL_END
