//
//  DZSiteListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"
#import "DZSiteListCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSiteListView : DZBaseTableView

@property (nonatomic, copy) backIndexPathBlock deleteBlock;  //!< 属性注释
@property (nonatomic, copy) backIndexPathBlock selectBlock;  //!< 属性注释


-(void)updateLocalSiteListView:(NSArray<DZSiteItem *> *)siteArray;





@end

NS_ASSUME_NONNULL_END
