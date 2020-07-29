//
//  DZThreadListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell.h"

@interface DZThreadListCell ()


@end

@implementation DZThreadListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initBaseGaoThreadCell];
        [self configThreadCellManager];
    }
    return self;
}


-(void)initBaseGaoThreadCell{
    
    [self.contentView addSubview:self.cellView];
}

-(void)configThreadCellManager{
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cellView.frame = self.bounds;
}


- (void)updateThreadListCell:(DZThreadListModel *)Model{
    _cellModel = Model;
    [self.cellView updateThreadCellView:Model];
}


-(DZThreadCellView *)cellView{
    if (!_cellView) {
        _cellView = [[DZThreadCellView alloc] init];
    }
    return _cellView;
}


@end
