//
//  DZAttachGridView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionView.h"
#import "DZGridFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@class DZMediaModel;

@interface DZAttachGridView : DZBaseCollectionView

-(void)updateDraftAttachList:(NSArray<DZMediaModel *> *)fileArray;



@end

NS_ASSUME_NONNULL_END
