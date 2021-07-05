//
//  DZWalletCashListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZCashLogStyle.h"
NS_ASSUME_NONNULL_BEGIN

@interface DZWalletCashListCell : DZBaseTableViewCell

- (void)updateWalletCashListCell:(DZQDataCashLog *)Model IndexPath:(NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
