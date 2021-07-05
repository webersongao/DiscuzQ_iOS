//
//  DZThreadStickyCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadStickyCell.h"
#import "DZThreadStickView.h"

@interface DZThreadStickyCell ()

@property (nonatomic, strong) DZThreadStickView *stickView;  //!< 属性注释

@end

@implementation DZThreadStickyCell


-(void)config_ThreadBaseListCell{
    [self.contentView addSubview:self.stickView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.stickView.frame = self.bounds;
}

- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    
    [self.stickView updateThreadStickView:Model];
    
}

-(DZThreadStickView *)stickView{
    if (!_stickView) {
        _stickView = [[DZThreadStickView alloc] init];
    }
    return _stickView;
}

@end
