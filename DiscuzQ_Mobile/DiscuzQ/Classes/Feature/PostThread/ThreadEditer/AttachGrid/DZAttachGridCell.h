//
//  DZAttachGridCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"

@class DZMediaModel;

@interface DZAttachGridCell : DZBaseCollectionCell

@property (nonatomic, strong) id fileAsset;

-(void)updateDraftAttachListCell:(DZMediaModel *)dataItem;

@end


