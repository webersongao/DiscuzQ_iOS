//
//  DZThreadPictureCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadPictureCell.h"
#import "DZThreadPicture.h"

@interface DZThreadPictureCell ()

@property (nonatomic, strong) DZThreadPicture *pictureView;  //!< 正常主题（文字 + 图片）

@end

@implementation DZThreadPictureCell

-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.pictureView];
}

-(void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadPictureCell:self.cellLayout];
    
    DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
    [self.pictureView updateThreadPicture:relateModel style:self.cellLayout.frame_content];
    
}


-(void)layoutThreadPictureCell:(DZThreadListStyle *)layout{
    
    self.pictureView.frame = layout.kf_content;
}



-(DZThreadPicture *)pictureView{
    if (!_pictureView) {
        _pictureView = [[DZThreadPicture alloc] initWithFrame:CGRectZero];
    }
    return _pictureView;
}






@end
