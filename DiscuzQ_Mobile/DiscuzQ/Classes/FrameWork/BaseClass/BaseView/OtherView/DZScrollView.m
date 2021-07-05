//
//  DZScrollView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"

@implementation DZScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

@end
