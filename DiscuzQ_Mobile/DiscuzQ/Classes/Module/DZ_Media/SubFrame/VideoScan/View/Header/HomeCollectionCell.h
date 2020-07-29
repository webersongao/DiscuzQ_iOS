//
//  HomeCollectionCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"

@interface HomeCollectionCell : DZBaseCollectionCell

@property (nonatomic, strong, readonly) DZQDataCate *cellModel;  //!< <#属性注释#>

-(void)updateForumCellWithModel:(DZQDataCate *)cellModel;

@end


