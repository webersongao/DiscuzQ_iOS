//
//  DZThreadListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"
#import "DZThreadStickView.h"

@interface DZThreadListCell ()

@property (nonatomic, strong) DZThreadCellView *innerView;  //!< 属性注释
@property (nonatomic, strong) DZThreadStickView *stickView;  //!< 属性注释
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

-(DZThreadCellView *)cellView{
    return self.innerView;
}

-(void)initBaseGaoThreadCell{
    
    [self.contentView addSubview:self.innerView];
    [self.contentView addSubview:self.stickView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.innerView.frame = self.bounds;
    self.stickView.frame = self.bounds;
}


- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    _innerModel = Model;
    BOOL isThreadStick = Model.attributes.isSticky;
    
    self.cellView.hidden = isThreadStick;
    self.stickView.hidden = !isThreadStick;
    
    if (isThreadStick) {
        [self.stickView updateThreadStickView:Model];
    }else{
        [self.cellView updateThreadBaseView:Model cellPath:indexPath];
    }
}


-(DZThreadCellView *)innerView{
    if (!_innerView) {
        _innerView = [[DZThreadCellView alloc] init];
    }
    return _innerView;
}

-(DZThreadStickView *)stickView{
    if (!_stickView) {
        _stickView = [[DZThreadStickView alloc] init];
    }
    return _stickView;
}


@end
