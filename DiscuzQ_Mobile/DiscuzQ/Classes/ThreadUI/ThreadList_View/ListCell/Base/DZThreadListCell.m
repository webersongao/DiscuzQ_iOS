//
//  DZThreadListCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadListCell.h"

@interface DZThreadListCell ()

@property (nonatomic, strong,readonly) DZQDataThread *innerModel;  //!<

@end

@implementation DZThreadListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_ThreadBaseListCell];
        [self configThreadCellManager];
    }
    return self;
}

-(DZQDataThread *)cellModel{
    return self.innerModel;
}

-(DZThreadListStyle *)cellLayout{
    return (DZThreadListStyle *)self.innerModel.styleModel;
}

-(void)config_ThreadBaseListCell{
    [self.contentView addSubview:self.userHeader];
    [self.contentView addSubview:self.bottomToolBar];
}

-(void)configThreadCellManager{
    
}


- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    _innerModel = Model;
    [self layoutThreadBaseCell:self.cellLayout];
    
    [self.userHeader updateThreadUserBar:[DZUIUserModel convertThreadModel:Model] style:self.cellLayout.frame_user];
    [self.bottomToolBar updateBottombar:Model Layout:self.cellLayout.frame_toolBar];
    
}


-(void)layoutThreadBaseCell:(DZThreadListStyle *)layout{
   
    self.userHeader.frame = layout.kf_head;
    self.bottomToolBar.frame = layout.kf_toolBar;
}


-(DZThreadHead *)userHeader{
    if (!_userHeader) {
        _userHeader = [[DZThreadHead alloc] initWithFrame:CGRectZero];
    }
    return _userHeader;
}



-(DZThreadBottomBar *)bottomToolBar{
    if (!_bottomToolBar) {
        _bottomToolBar = [[DZThreadBottomBar alloc] initWithFrame:CGRectZero];
    }
    return _bottomToolBar;
}



@end
