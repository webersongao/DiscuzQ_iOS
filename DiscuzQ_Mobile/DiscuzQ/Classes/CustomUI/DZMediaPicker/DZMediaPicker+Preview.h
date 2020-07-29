//
//  DZMediaPicker+Preview.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPicker.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMediaPicker (Preview)


// 预览 单张照片 或 视频
- (void)inner_dz_previewSingleMediaWithAsset:(PHAsset *)asset;

// 预览多张 照片 或 视频
- (void)inner_dz_previewMediaWithAssets:(NSMutableArray<PHAsset *> *)AssetArray selectedPhotos:(NSMutableArray *)selectedPhotos selindex:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
