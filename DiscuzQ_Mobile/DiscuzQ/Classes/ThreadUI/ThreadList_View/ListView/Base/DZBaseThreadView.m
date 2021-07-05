//
//  DZBaseThreadView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseThreadView.h"
#import "DZHomeCellCenter.h"

@implementation DZBaseThreadView

- (instancetype)initWithListFrame:(CGRect)frame{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        for (NSInteger index = -1; index <= 6; index ++) {
            Class cellClass = [DZHomeCellCenter cellClassWithType:index];
            [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
        }
    }
    return self;
}




@end
