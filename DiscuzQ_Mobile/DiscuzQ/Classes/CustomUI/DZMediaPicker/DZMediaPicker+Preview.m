//
//  DZMediaPicker+Preview.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPicker+Preview.h"

@implementation DZMediaPicker (Preview)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

// 预览 单张照片 或 视频
- (void)inner_dz_previewSingleMediaWithAsset:(PHAsset *)asset{
    
    BOOL isVideo = NO;
    isVideo = asset.mediaType == PHAssetMediaTypeVideo;
    
    if ([[asset valueForKey:@"filename"] containsString:@"GIF"] && self.is_APickGif && !self.is_APickMuitlpleVideo) {
        TZGifPhotoPreviewController *vc = [[TZGifPhotoPreviewController alloc] init];
        TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypePhotoGif timeLength:@""];
        vc.model = model;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.naviController presentViewController:vc animated:YES completion:nil];
    } else if (isVideo && !self.is_APickMuitlpleVideo) { // perview video / 预览视频
        TZVideoPlayerController *vc = [[TZVideoPlayerController alloc] init];
        TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypeVideo timeLength:@""];
        vc.model = model;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.naviController presentViewController:vc animated:YES completion:nil];
    }else{
        KSLog(@"别问我为啥");
    }
}

// 预览多张 照片 或 视频
- (void)inner_dz_previewMediaWithAssets:(NSMutableArray<PHAsset *> *)AssetArray selectedPhotos:(NSMutableArray *)selectedPhotos selindex:(NSInteger)index{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:AssetArray selectedPhotos:selectedPhotos index:index];
    imagePickerVc.maxImagesCount = self.maxPickCount;
    imagePickerVc.allowPickingGif = self.is_APickGif;
    imagePickerVc.allowPickingOriginalPhoto = self.is_Original;
    imagePickerVc.allowPickingMultipleVideo = self.is_APickMuitlpleVideo;
    imagePickerVc.showSelectedIndex = self.is_SelectBadge;
    imagePickerVc.isSelectOriginalPhoto = self.is_Original;
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL is_Original) {
        if (self.didPreviewBlock) {
            self.didPreviewBlock(photos, assets, is_Original);
        }
    }];
    
    [self.naviController presentViewController:imagePickerVc animated:YES completion:nil];
    
}




#pragma clang diagnostic pop


@end
