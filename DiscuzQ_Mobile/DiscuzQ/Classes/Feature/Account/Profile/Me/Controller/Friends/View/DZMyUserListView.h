//
//  DZMyUserListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyUserListView : DZBaseTableView

- (instancetype)initWithListFrame:(CGRect)frame;

-(void)updateMyUserListView:(NSArray<DZQDataFollow *>*)array isFrom:(BOOL)isFrom;




@end

NS_ASSUME_NONNULL_END
