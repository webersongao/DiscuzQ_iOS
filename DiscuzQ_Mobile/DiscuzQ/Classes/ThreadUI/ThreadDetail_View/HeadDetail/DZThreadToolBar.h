//
//  DZThreadToolBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadToolBar : DZThreadBottomBar


-(void)updateDetailToolBar:(DZQDataThread *)Model toolLayout:(DZDToolBarStyle *)toolLayout;



@end

NS_ASSUME_NONNULL_END
