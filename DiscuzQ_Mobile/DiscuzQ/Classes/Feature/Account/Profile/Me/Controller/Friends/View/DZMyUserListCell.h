//
//  DZMyUserListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyUserListCell : DZBaseTableViewCell

- (void)updateMyUserCell:(DZQDataFollow *)Model isFromUser:(BOOL)isFromUser ;




@end

NS_ASSUME_NONNULL_END
