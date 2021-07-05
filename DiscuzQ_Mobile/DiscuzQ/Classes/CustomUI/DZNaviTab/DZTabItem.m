//
//  DZTabItem.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZTabItem.h"

@implementation DZTabItem


- (instancetype)initWithTitle:(NSString *)title class:(Class)subCls
{
    self = [super init];
    if (self) {
        _subCls = subCls;
        _title = checkNull(title);
        _viewCtrl = [subCls new];
    }
    return self;
}


@end
