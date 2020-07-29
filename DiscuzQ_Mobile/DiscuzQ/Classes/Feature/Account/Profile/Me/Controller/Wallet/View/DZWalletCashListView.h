//
//  DZWalletCashListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZWalletCashListView : DZBaseTableView

- (instancetype)initWithListFrame:(CGRect)frame;

-(void)updateWalletCashHeader:(DZQDataWallet *)dataModel;

-(void)updateWalletCashListView:(NSArray<DZQDataCashLog *>*)array;




@end

NS_ASSUME_NONNULL_END
