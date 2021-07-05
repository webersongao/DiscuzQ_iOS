//
//  DZMediaPicker+Pick.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPicker+Pick.h"

@interface DZMediaPicker ()

@end

@implementation DZMediaPicker (Pick)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)inner_dz_PickMediaFromPhotoLibrary{
    
    if (self.maxPickCount <= 0) {
        return;
    }
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:self.maxPickCount columnNumber:self.columnNumber delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.barItemTextColor = KTitle_Color;
    [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:KTitle_Color}];
    imagePickerVc.navigationBar.tintColor = KTitle_Color;
    imagePickerVc.naviBgColor = KWhite_Color;
    imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = self.is_Original;
    
    if (self.maxPickCount > 1) {
        // 1.设置目前已经选中的图片数组
        imagePickerVc.selectedAssets = self.local_hasAssets; // 目前已经选中的图片数组
    }
    imagePickerVc.allowTakePicture = self.is_TakePhoto; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = self.is_TakeVideo;   // 在内部显示拍视频按
    imagePickerVc.videoMaximumDuration = self.videoMaxDuration; // 视频最大拍摄时间
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
    }];
    
    imagePickerVc.photoWidth = 1080;
    // imagePickerVc.photoPreviewMaxWidth = 1600;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.navigationBar.translucent = NO;
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [KWhite_Color colorWithAlphaComponent:0.8];
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    /*
     [imagePickerVc setAssetCellDidSetModelBlock:^(TZAssetCell *cell, UIImageView *imageView, UIImageView *selectImageView, UILabel *indexLabel, UIView *bottomView, UILabel *timeLength, UIImageView *videoImgView) {
     cell.contentView.clipsToBounds = YES;
     cell.contentView.layer.cornerRadius = cell.contentView.tz_width * 0.5;
     }];
     */
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = self.is_APickVideo;
    imagePickerVc.allowPickingImage = self.is_APickImage;
    imagePickerVc.allowPickingOriginalPhoto = self.is_Original;
    imagePickerVc.allowPickingGif = self.is_APickGif;
    imagePickerVc.allowPickingMultipleVideo = self.is_APickMuitlpleVideo; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = self.is_SortAscend;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = self.is_AllowCrop;
    imagePickerVc.needCircleCrop = self.is_CircleCrop;
    // 设置竖屏下的裁剪尺寸
    imagePickerVc.cropRect = self.crop_frame;
    imagePickerVc.scaleAspectFillCrop = YES;
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
     [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
     [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
     [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
     }];
     imagePickerVc.delegate = self;
     */
    
    // Deprecated, Use statusBarStyle
    // imagePickerVc.isStatusBarDefault = NO;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置是否显示图片序号
    imagePickerVc.showSelectedIndex = self.is_SelectBadge;
    
    // 设置拍照时是否需要定位，仅对选择器内部拍照有效，外部拍照的，请拷贝demo时手动把pushImagePickerController里定位方法的调用删掉
    // imagePickerVc.allowCameraLocation = NO;
    
    // 自定义gif播放方案
    [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
        FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        FLAnimatedImageView *animatedImageView;
        for (UIView *subview in imageView.subviews) {
            if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
                animatedImageView = (FLAnimatedImageView *)subview;
                animatedImageView.frame = imageView.bounds;
                animatedImageView.animatedImage = nil;
            }
        }
        if (!animatedImageView) {
            animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
            animatedImageView.runLoopMode = NSDefaultRunLoopMode;
            [imageView addSubview:animatedImageView];
        }
        animatedImageView.animatedImage = animatedImage;
    }];
    
    // 设置首选语言 / Set preferred language
    imagePickerVc.preferredLanguage = @"zh-Hans";
    
#pragma mark - 配置项 到这里为止
    
    // 你可以通过block或者代理，来得到用户选择的照片.(单张照片 多张照片 多个视频)
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL is_Original) {
        KSLog(@"WBS 选取结束 setDidFinishPickingPhotosHandle ");
        [self refreshBlockWithAddedAsset:assets photos:photos];
    }];
    
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.naviController presentViewController:imagePickerVc animated:YES completion:nil];
}



#pragma mark   /************* TZImagePickerControllerDelegate *************/

/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    KSLog(@"WBS 取消了 tz_imagePickerControllerDidCancel");
    if (self.media_errorBlock) {
        self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"取消了多媒体选择Piker"));
    }
}


// 这个照片选择器会自己dismiss，当选择器dismiss的时候，会执行下面的代理方法
// 你也可以设置autoDismiss属性为NO，选择器就不会自己dismis了
// 如果is_Original为YES，表明用户选择了原图
// 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets is_Original:(BOOL)is_Original infos:(NSArray<NSDictionary *> *)infos {
    
    //    // 1.打印图片名字
    //    for (PHAsset *asset in assets) {
    //       NSString * fileName = [asset valueForKey:@"filename"];
    //        KSLog(@"WBS 图片名字:%@",fileName);
    //        KSLog(@"location:%@",asset.location);
    //    }
    
}


// 如果用户选择了一个视频且allowPickingMultipleVideo是NO，下面的代理方法会被执行
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset {
    
    // 导出 MP4 视频
    [picker showProgressHUD];
    [self dz_exportVideoOutputPathWithAsset:asset success:^(NSString *outputPath, NSError *error) {
        [picker hideProgressHUD];
        outputPath = checkNull(outputPath);
        if (self.media_VideoBlock && coverImage && asset) {
            self.media_VideoBlock(@[coverImage], @[asset], @[outputPath]);
        }else{
            if (self.media_errorBlock) {
                self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"视频数据处理异常"));
            }
        }
    }];
}

// 如果用户选择了一个gif图片且allowPickingMultipleVideo是NO，下面的代理方法会被执行
// 如果allowPickingMultipleVideo是YES，将会调用imagePickerController:didFinishPickingPhotos:sourceAssets:is_Original:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
    // 选中了 单张gif图片
    if (self.media_PictureBlock && asset && animatedImage) {
        self.media_PictureBlock(@[animatedImage], @[asset], self.is_Original);
    }else{
        if (self.media_errorBlock) {
            self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"gif类型数据不支持"));
        }
    }
}

// Decide album show or not't
// 决定相册显示与否
- (BOOL)isAlbumCanSelect:(NSString *)albumName result:(PHFetchResult *)result {
    /*
     if ([albumName isEqualToString:@"个人收藏"]) {
     return NO;
     }
     if ([albumName isEqualToString:@"视频"]) {
     return NO;
     }*/
    return YES;
}

// Decide asset show or not't
// 决定asset显示与否
- (BOOL)isAssetCanSelect:(PHAsset *)asset {
    /*
     switch (asset.mediaType) {
     case PHAssetMediaTypeVideo: {
     // 视频时长
     // NSTimeInterval duration = phAsset.duration;
     return NO;
     } break;
     case PHAssetMediaTypeImage: {
     // 图片尺寸
     if (phAsset.pixelWidth > 3000 || phAsset.pixelHeight > 3000) {
     // return NO;
     }
     return YES;
     } break;
     case PHAssetMediaTypeAudio:
     return NO;
     break;
     case PHAssetMediaTypeUnknown:
     return NO;
     break;
     default: break;
     }
     */
    return YES;
}



#pragma mark   /********************* 工具方法 *************************/

// 得到的视频 或 图片(单张照片 多张照片 多个视频)
- (void)refreshBlockWithAddedAsset:(NSArray <PHAsset *>*)assets photos:(NSArray <UIImage *> *)photos {
    
    // 1.打印图片名字
    for (PHAsset *asset in assets) {
        if (asset.mediaType != PHAssetMediaTypeImage) {
            if (self.media_errorBlock) {
                self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"非相册图片类型数据，不支持"));
            }
            return;
        }
    }
    
    if (self.media_PictureBlock && photos.count && assets.count) {
        self.media_PictureBlock(photos, assets, self.is_Original);
    }else{
        if (self.media_errorBlock) {
            self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"相册图片选中失败"));
        }
    }
    
}






#pragma clang diagnostic pop

@end
