//
//  DZSettingListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSettingListCell : DZBaseTableViewCell


-(void)updateCell:(NSString *)title detail:(NSString *)detail indexPath:(NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
