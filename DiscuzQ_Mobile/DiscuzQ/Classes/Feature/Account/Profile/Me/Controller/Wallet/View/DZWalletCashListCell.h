//
//  DZWalletCashListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZWalletCashListCell : DZBaseTableViewCell

- (void)updateWalletCashListCell:(DZQDataCashLog *)Model IndexPath:(NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
