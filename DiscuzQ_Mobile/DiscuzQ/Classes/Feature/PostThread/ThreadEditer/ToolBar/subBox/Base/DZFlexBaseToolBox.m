//
//  DZFlexBaseToolBox.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZFlexBaseToolBox.h"

@interface DZFlexBaseToolBox ()

@property (nonatomic, assign) CGFloat allWidth;  //!< <#属性注释#>

@end

@implementation DZFlexBaseToolBox

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _spread = YES;
        self.clipsToBounds = YES;
        self.allWidth = frame.size.width;
        [self addSubview:self.boxScroll];
    }
    return self;
}

-(void)setSpread:(BOOL)spread{
    _spread = spread;
    if (spread) {
        self.width = self.allWidth;
    }else{
        self.width = 0;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.allWidth = (self.allWidth < self.width) ? self.width : self.allWidth;
}


-(UIScrollView *)boxScroll{
    if (!_boxScroll) {
        _boxScroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        _boxScroll.showsHorizontalScrollIndicator = NO;
        _boxScroll.showsVerticalScrollIndicator = NO;
        _boxScroll.bounces = YES;
    }
    return _boxScroll;
}

@end
