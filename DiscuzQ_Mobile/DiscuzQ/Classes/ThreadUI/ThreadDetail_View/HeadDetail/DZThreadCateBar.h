//
//  DZThreadCateBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateBar : DZThreadBottomBar

-(void)updateDetailBarCate:(NSString *)cateName location:(NSString *)location Layout:(DZDToolBarStyle *)toolLayout;


@end

NS_ASSUME_NONNULL_END
