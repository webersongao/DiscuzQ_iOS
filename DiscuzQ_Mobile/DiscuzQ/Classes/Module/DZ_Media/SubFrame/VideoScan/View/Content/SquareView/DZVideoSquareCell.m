//
//  DZVideoSquareCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoSquareCell.h"

@implementation DZVideoSquareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configHomeSquareCell];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cellView.frame = self.bounds;
}

-(void)configHomeSquareCell{

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












