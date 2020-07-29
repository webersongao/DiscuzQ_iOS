//
//  DZVideoSquareCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoSquareCell.h"

@implementation DZVideoSquareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configDiscoverSquareCell];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cellView.frame = self.bounds;
}

-(void)configDiscoverSquareCell{

    [self.contentView addSubview:self.cellView];
}

- (void)updateThreadInnerCell:(DZQDataThread *)Model{
    
    
}



-(DZThreadCellView *)cellView{
    if (!_cellView) {
        _cellView = [[DZThreadCellView alloc] init];
    }
    return _cellView;
}



@end












