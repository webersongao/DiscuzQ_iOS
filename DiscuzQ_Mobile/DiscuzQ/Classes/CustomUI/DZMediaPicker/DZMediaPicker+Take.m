//
//  DZMediaPicker+Take.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPicker+Take.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface DZMediaPicker ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation DZMediaPicker (Take)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)inner_dz_TakeMediaFromUserCamera{
    
    [self inner_CheckAuthorizationBeforeOpenCamera];
}

-(void)inner_CheckAuthorizationBeforeOpenCamera{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        [self inner_ShowAuthorizationStatusAlert:@"相机"];
        
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self inner_CheckAuthorizationBeforeOpenCamera];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) {
        // 已被拒绝，没有相册权限，将无法保存拍的照片
        [self inner_ShowAuthorizationStatusAlert:@"相册"];
        
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self inner_CheckAuthorizationBeforeOpenCamera];
        }];
    } else {
        [self inner_PickMediaFromPhotoCamera];
    }
}


// 从 相机拍照
- (void)inner_PickMediaFromPhotoCamera {
    // 提前定位
    __weak typeof(self) weakSelf = self;
    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = [locations firstObject];
    } failureBlock:^(NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = nil;
    }];
    self.OriImagePicker.delegate = self;
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.OriImagePicker.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        if (self.is_TakeVideo) {
            [mediaTypes addObject:(NSString *)kUTTypeMovie];
        }
        if (self.is_TakePhoto) {
            [mediaTypes addObject:(NSString *)kUTTypeImage];
        }
        if (mediaTypes.count) {
            self.OriImagePicker.mediaTypes = mediaTypes;
        }
        [self.naviController presentViewController:self.OriImagePicker animated:YES completion:nil];
    } else {
        KSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}


#pragma mark   /********************* UIImagePickerControllerDelegate *************************/

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = self.is_SortAscend;
    [tzImagePickerVc showProgressHUD];
    
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        //保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                KSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                if (self.is_AllowCrop) { // 允许裁剪,去裁剪
                    
                    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
                        [self refreshBlockWithAddedAsset:asset image:cropImage videoPath:nil];
                    }];
                    imagePicker.allowPickingImage = YES;
                    imagePicker.cropRect = self.crop_frame;
                    imagePicker.needCircleCrop = self.is_CircleCrop;
                    imagePicker.circleCropRadius = CGRectGetWidth(self.crop_frame)/2.0;
                    [self.naviController presentViewController:imagePicker animated:YES completion:nil];
                } else {
                    [self refreshBlockWithAddedAsset:assetModel.asset image:image videoPath:nil];
                }
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *localUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (localUrl) {
            [[TZImageManager manager] saveVideoWithUrl:localUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            [self refreshBlockWithAddedAsset:assetModel.asset image:photo videoPath:localUrl.absoluteString];
                        }
                    }];
                }
            }];
        }
    }
}

// 得到的视频 或 图片
- (void)refreshBlockWithAddedAsset:(PHAsset *)asset image:(UIImage *)prePic videoPath:(NSString *)videoPath {
    
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
        KSLog(@"WBS 多媒体 位置location:%@",phAsset.location);
    }
    
    if (!asset || !prePic) {
        if (self.media_errorBlock) {
            self.media_errorBlock(@[], @[], nil);
        }
        return;
    }
    
    
    if (asset.mediaType == PHAssetMediaTypeImage) {
        if (self.media_PictureBlock) {
            self.media_PictureBlock(@[prePic], @[asset], self.is_Original);
        }
    }else if (asset.mediaType == PHAssetMediaTypeVideo){
        if (self.media_VideoBlock && videoPath) {
            // 导出 MP4 视频文件
            [self dz_exportVideoOutputPathWithAsset:asset success:^(NSString *localPath, NSError *error) {
                
                localPath = checkNull(localPath);
                self.media_VideoBlock(@[prePic], @[asset], @[localPath]);
            }];
            
        }else{
            if (self.media_errorBlock) {
                self.media_errorBlock(@[prePic], @[asset], DZQError(@"imagePocker", -1, @"缺少视频数据"));
            }
        }
    }else if (asset.mediaType == PHAssetMediaTypeAudio){
        // 音频
        KSLog(@"WBS 获取到了音频 不处理");
        if (self.media_errorBlock) {
            self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"音频数据类型不支持"));
        }
    }else{
        KSLog(@"WBS 数据异常");
        if (self.media_errorBlock) {
            self.media_errorBlock(nil, nil, DZQError(@"imagePocker", -1, @"数据类型不支持"));
        }
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark   /********************* 工具方法 *************************/

-(void)inner_ShowAuthorizationStatusAlert:(NSString *)type{
    
    NSString *title = [NSString stringWithFormat:@"无法访问%@",type];
    NSString *content = [NSString stringWithFormat:@"请在iPhone的""设置-隐私-%@""中允许访问%@",type,type];
    
    ZHAlertView *alertV = [[ZHAlertView alloc] initWithTitle:title contentText:content leftButtonTitle:@"取消" rightButtonTitle:@"设置"];
    alertV.rightBlock = ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:nil completionHandler:nil];
    };
    
    [alertV show];
}


-(void)dealloc{
    KSLog(@"DZMediaPicker");
}

#pragma clang diagnostic pop

@end
