//
//  DZMediaPicker.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TZImagePickerController.h>
#import <FLAnimatedImage.h>

typedef enum : NSUInteger {
    DZPicker_Video,  // 单个视频
    DZPicker_singlePic,  // 单张图片
    DZPicker_MuitlplePic,  // 多张 图片
} DZPickerType;

typedef void(^DZPreViewBlock)(NSArray<UIImage *> *imageArr , NSArray<PHAsset *> *AssetArr, BOOL isOrigin);


typedef void(^DZErrorBlock)(NSArray<UIImage *> *imageArr , NSArray<PHAsset *> *AssetArr, NSError *error);

typedef void(^DZImageBlock)(NSArray<UIImage *> *imageArr , NSArray<PHAsset *> *AssetArr, BOOL isOrigin);

typedef void(^DZVideoBlock)(NSArray<UIImage *> *prePicArr , NSArray<PHAsset *> *AssetArr,NSArray<NSString *> *videoPathArr);


@interface DZMediaPicker : NSObject <TZImagePickerControllerDelegate>

@property (nonatomic, assign,readonly) BOOL is_Original;  /// 是否允许原图
@property (nonatomic, assign,readonly) BOOL is_TakePhoto;  ///< 允许拍照
@property (nonatomic, assign,readonly) BOOL is_TakeVideo;  ///< 允许拍视频
@property (nonatomic, assign,readonly) BOOL is_SortAscend;   ///< 照片排列按修改时间升序
@property (nonatomic, assign,readonly) BOOL is_APickGif;  ///< 允许选择Gif
@property (nonatomic, assign,readonly) BOOL is_APickVideo; ///< 允许选择视频
@property (nonatomic, assign,readonly) BOOL is_APickImage; ///< 允许选择图片
@property (nonatomic, assign,readonly) NSInteger maxPickCount;  ///< 照片最大可选张数，设置为1即为单选模式
@property (nonatomic, assign,readonly) NSInteger columnNumber; /// 每行展示照片数
@property (nonatomic, assign,readonly) NSTimeInterval videoMaxDuration;  ///< 允许视频最大时长

@property (nonatomic, assign,readonly) BOOL is_AllowCrop;  // 是否允许裁剪
@property (nonatomic, assign,readonly) BOOL is_CircleCrop;  // 单选情况下是否使用圆形裁剪框
@property (nonatomic, assign,readonly) BOOL is_APickMuitlpleVideo; // // 是否可以多选视频
@property (nonatomic, assign,readonly) BOOL is_SelectBadge;  // 是否显示 选中数量数字
@property (nonatomic, assign,readonly) CGRect crop_frame;  // 裁剪默认的矩形frame

@property (strong, nonatomic) CLLocation *location;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) UIImagePickerController *OriImagePicker;  //!< 属性注释

@property (nonatomic, strong,readonly) NSMutableArray *local_hasAssets;;  //!< 已经选中的资源
@property (nonatomic, weak,readonly) UINavigationController *naviController;

@property (nonatomic, copy) DZVideoBlock media_VideoBlock;  //!< 属性注释
@property (nonatomic, copy) DZErrorBlock media_errorBlock;  //!< 属性注释
@property (nonatomic, copy) DZImageBlock media_PictureBlock;  //!< 属性注释

// 多张照片或视频 预览结束的block
@property (nonatomic, copy) DZImageBlock didPreviewBlock;

+(instancetype)Shared;

// 拍摄 照片
-(void)dz_PickerTo_TakeImageWithNaviCtrl:(UINavigationController *)naviCtrl;

// 拍摄 视频
-(void)dz_PickerTo_TakeVideoWithNaviCtrl:(UINavigationController *)naviCtrl;


// 相册 选择 照片 (一次最多选9张)
-(void)dz_PickerToPickImage:(DZPickerType)type naviCtrl:(UINavigationController *)naviCtrl;

// 相册 选择 (单选)视频 只支持 DZPicker_Video
-(void)dz_PickerToPickVideo:(DZPickerType)type naviCtrl:(UINavigationController *)naviCtrl;


// 带有UI的单张图片选择 （ 仅限用户更换头像 处使用）
-(void)dz_ShowAvatarPickerSheet:(UINavigationController *)naviCtrl;


// 预览 单张照片 或 视频
- (void)dz_PreviewSingleMediaWithAsset:(PHAsset *)Asset naviCtrl:(UINavigationController *)naviCtrl;


// 预览多张 照片 或 视频
- (void)dz_PreviewMediasWithAssets:(NSMutableArray<PHAsset *> *)AssetArray selectedPhotos:(NSMutableArray *)selectedPhotos selindex:(NSInteger)index;


// 视频转码MP4 并返回路径
-(void)dz_exportVideoOutputPathWithAsset:(PHAsset *)asset success:(void (^)(NSString *outputPath , NSError *error))success;



@end


