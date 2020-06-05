//
//  DZThreadListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"

@interface DZThreadListCell ()

@property (nonatomic, strong) DZThreadBaseView *innerView;  //!< 属性注释
@property (nonatomic, strong,readonly) DZQDataThread *innerModel;  //!<

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

-(DZQDataThread *)cellModel{
    return self.innerModel;
}

-(DZThreadBaseView *)cellView{
    return self.innerView;
}

-(void)initBaseGaoThreadCell{
    
    [self.contentView addSubview:self.innerView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.innerView.frame = self.bounds;
}


- (void)updateThreadListCell:(DZQDataThread *)Model{
    _innerModel = Model;
    [self.cellView updateThreadBaseView:Model];
}


-(DZThreadBaseView *)innerView{
    if (!_innerView) {
        _innerView = [[DZThreadBaseView alloc] init];
    }
    return _innerView;
}


@end
