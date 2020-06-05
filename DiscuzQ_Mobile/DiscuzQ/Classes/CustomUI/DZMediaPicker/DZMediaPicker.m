//
//  DZMediaPicker.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPicker+Pick.h"
#import "DZMediaPicker+Take.h"
#import "DZMediaPicker+Preview.h"
#import "UIAlertController+Extension.h"

@interface DZMediaPicker ()


@end

@implementation DZMediaPicker

static DZMediaPicker *instance = nil;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

+(instancetype)Shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self resetConfigration];
    }
    return self;
}

-(void)resetConfigration{
    
    _maxPickCount = 1;
    _columnNumber = 4;
    _is_APickGif = NO;
    _is_CircleCrop = NO;
    _is_SortAscend = YES;
    _is_Original = YES;
    _is_APickMuitlpleVideo = NO;
    
    _is_TakePhoto = YES;
    _is_TakeVideo = YES;
    
    _is_APickVideo = YES;
    _is_APickImage = YES;
    
    _is_AllowCrop = YES;
    _is_SelectBadge = YES;
    
    _naviController  = nil;
    
    _naviController = nil;
    _videoMaxDuration = 60*5; // 最大拍摄时长5分钟
    CGFloat cropWH = KScreenWidth - kMargin30;
    CGFloat topX = (KScreenHeight - cropWH)/2.0;
    // 默认为正方形
    _crop_frame = CGRectMake(kMargin15, topX, cropWH, cropWH);
}


// 拍摄 头像 照片
-(void)inner_dz_PickerTo_TakeAvatarWithNaviCtrl:(UINavigationController *)naviCtrl{
    
    [self resetConfigration];
    
    _is_TakePhoto = YES;
    _is_TakeVideo = NO;
    
    _is_APickVideo = NO;
    _is_APickImage = NO;
    
    _is_AllowCrop = YES;
    _is_SelectBadge = NO;
    
    _naviController = naviCtrl;
    [self inner_dz_TakeMediaFromUserCamera];
}

// 相册 选择 头像照片
-(void)inner_dz_PickerTo_PickAvatarWithNaviCtrl:(UINavigationController *)naviCtrl{
    
    [self resetConfigration];
    
    _maxPickCount = 1;
    _is_TakePhoto = NO;
    _is_TakeVideo = NO;
    
    _is_APickVideo = NO;
    _is_APickImage = YES;
    
    _is_AllowCrop = YES;
    _is_SelectBadge = NO;
    
    _naviController = naviCtrl;
    [self inner_dz_PickMediaFromPhotoLibrary];
}


// 拍摄 照片
-(void)dz_PickerTo_TakeImageWithNaviCtrl:(UINavigationController *)naviCtrl{
    
    [self resetConfigration];
    
    _is_TakePhoto = YES;
    _is_TakeVideo = NO;
    
    _is_APickVideo = NO;
    _is_APickImage = NO;
    
    _is_AllowCrop = NO;
    _is_SelectBadge = NO;
    
    _naviController = naviCtrl;
    [self inner_dz_TakeMediaFromUserCamera];
}

// 拍摄 视频
-(void)dz_PickerTo_TakeVideoWithNaviCtrl:(UINavigationController *)naviCtrl{
    
    [self resetConfigration];
    
    _is_TakePhoto = NO;
    _is_TakeVideo = YES;
    
    _is_APickVideo = NO;
    _is_APickImage = NO;
    
    _is_Original = NO;
    _is_AllowCrop = NO;
    _is_SelectBadge = NO;
    
    _naviController = naviCtrl;
    [self inner_dz_TakeMediaFromUserCamera];
    
}


// 相册 选择 照片 (一次最多选9张)
-(void)dz_PickerToPickImage:(DZPickerType)type naviCtrl:(UINavigationController *)naviCtrl{
    
    [self resetConfigration];
    
    BOOL is_indexBadge = NO;
    NSInteger picCount = 1;
    if (type == DZPicker_singlePic) {
        is_indexBadge = NO;
        picCount = 1;
    }else if (type == DZPicker_MuitlplePic){
        is_indexBadge = YES;
        picCount = 9;
    }else{
        KSLog(@"异常不处理");
    }
    
    _maxPickCount = picCount;
    _is_TakePhoto = NO;
    _is_TakeVideo = NO;
    
    _is_APickVideo = NO;
    _is_APickImage = YES;
    
    _is_AllowCrop = NO;
    _is_SelectBadge = is_indexBadge;
    
    _naviController = naviCtrl;
    [self inner_dz_PickMediaFromPhotoLibrary];
}

// 相册 选择 (单选)视频 只支持 DZPicker_Video
-(void)dz_PickerToPickVideo:(DZPickerType)type naviCtrl:(UINavigationController *)naviCtrl{
    
    if (type != DZPicker_Video) {
        return;
        KSLog(@"异常不处理");
    }
    
    [self resetConfigration];
    
    _is_TakePhoto = NO;
    _is_TakeVideo = NO;
    
    _is_APickVideo = YES;
    _is_APickImage = NO;
    
    _is_Original = NO;
    _is_AllowCrop = NO;
    _is_SelectBadge = NO;
    
    _naviController = naviCtrl;
    [self inner_dz_PickMediaFromPhotoLibrary];
}

// 带有UI的单张图片选择 （ 仅限用户更换头像 处使用）
-(void)dz_ShowAvatarPickerSheet:(UINavigationController *)naviCtrl{
    
    [UIAlertController alertSheetTitle:nil message:nil controller:naviCtrl doneTextArr:@[@"拍照",@"从手机相册获取"] cancelText:@"取消" doneHandle:^(NSInteger index) {
        if (index == 0) {
            [self inner_dz_PickerTo_TakeAvatarWithNaviCtrl:naviCtrl];
        } else if (index == 1) {
            [self inner_dz_PickerTo_PickAvatarWithNaviCtrl:naviCtrl];
        }
    } cancelHandle:nil];
}


// 预览 单张照片 或 视频
- (void)dz_PreviewSingleMediaWithAsset:(PHAsset *)Asset naviCtrl:(UINavigationController *)naviCtrl{
    
    KSLog(@"WBS  001 该功能尚未完善");
    return;
    _naviController = naviCtrl;
    [self inner_dz_previewSingleMediaWithAsset:Asset];
    
}

// 预览多张 照片 或 视频
- (void)dz_PreviewMediasWithAssets:(NSMutableArray<PHAsset *> *)AssetArray selectedPhotos:(NSMutableArray *)selectedPhotos selindex:(NSInteger)index{
    
    KSLog(@"WBS  002 该功能尚未完善");
    return;
    _naviController = nil;
    [self inner_dz_previewMediaWithAssets:AssetArray selectedPhotos:selectedPhotos selindex:index];
}

#pragma mark   /********************* 工具方法 *************************/

// 视频转码MP4 并返回路径
-(void)dz_exportVideoOutputPathWithAsset:(PHAsset *)asset success:(void (^)(NSString *outputPath , NSError *error))success {
    
    [self.operationQueue addOperationWithBlock:^{
        [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPresetMediumQuality success:^(NSString *outputPath) {
            
            NSString *loalPath = checkNull(outputPath);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (success) {
                    success(loalPath,nil);
                }
            }];
        } failure:^(NSString *errorMessage, NSError *error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (success) {
                    success(nil,error);
                }
            }];
        }];
        
    }];
    
}

#pragma mark   /********************* 初始化 *************************/

-(NSOperationQueue *)operationQueue{
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.maxConcurrentOperationCount = 1;
    }
    return _operationQueue;
}

- (UIImagePickerController *)OriImagePicker {
    if (!_OriImagePicker) {
        _OriImagePicker = [[UIImagePickerController alloc] init];
        // set appearance / 改变相册选择页的导航栏外观
        _OriImagePicker.videoMaximumDuration = self.videoMaxDuration;
        _OriImagePicker.navigationBar.barTintColor = self.naviController.navigationBar.barTintColor;
        _OriImagePicker.navigationBar.tintColor = self.naviController.navigationBar.tintColor;
        UIBarButtonItem * tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
        UIBarButtonItem * BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _OriImagePicker;
}

@end
