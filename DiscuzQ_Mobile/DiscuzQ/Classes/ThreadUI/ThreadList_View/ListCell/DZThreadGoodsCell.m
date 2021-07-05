//
//  DZThreadGoodsCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadGoodsCell.h"
#import "DZThreadGoods.h"

@interface DZThreadGoodsCell ()

@property (nonatomic, strong) DZThreadGoods *goodsView;  //!< <#属性注释#>

@end

@implementation DZThreadGoodsCell


-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.goodsView];
}


- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadGoodsCell:self.cellLayout];
    
    DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
    [self.goodsView updateThreadGoods:relateModel style:self.cellLayout.frame_content];
    
}


-(void)layoutThreadGoodsCell:(DZThreadListStyle *)layout{
    
    self.goodsView.frame = layout.kf_content;
}





-(DZThreadGoods *)goodsView{
    if (!_goodsView) {
        _goodsView = [[DZThreadGoods alloc] initWithFrame:CGRectZero];
    }
    return _goodsView;
}









@end
