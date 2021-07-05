//
//  DZThreadNormalCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadNormalCell.h"
#import "DZThreadNormal.h"

@interface DZThreadNormalCell ()

@property (nonatomic, strong) DZThreadNormal *normalView;  //!< 正常主题（文字 + 图片）

@end

@implementation DZThreadNormalCell

-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.normalView];
}

-(void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadNormalCell:self.cellLayout];
    
    DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
    [self.normalView updateThreadNormal:relateModel style:self.cellLayout.frame_content];
}


-(void)layoutThreadNormalCell:(DZThreadListStyle *)layout{
    
    self.normalView.frame = layout.kf_content;
}



-(DZThreadNormal *)normalView{
    if (!_normalView) {
        _normalView = [[DZThreadNormal alloc] initWithFrame:CGRectZero];
    }
    return _normalView;
}






@end
