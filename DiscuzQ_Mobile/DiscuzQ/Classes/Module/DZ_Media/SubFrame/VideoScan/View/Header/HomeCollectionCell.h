//
//  HomeCollectionCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"

@interface HomeCollectionCell : DZBaseCollectionCell

@property (nonatomic, strong, readonly) DZThreadCateM *cellModel;

-(void)updateForumCellWithModel:(DZThreadCateM *)cellModel;

@end


