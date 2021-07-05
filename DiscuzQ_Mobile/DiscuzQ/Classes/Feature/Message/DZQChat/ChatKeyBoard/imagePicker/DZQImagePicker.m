//
//  DZQImagePicker.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQImagePicker.h"
#import <Photos/Photos.h>

@interface DZQImagePicker ()

//访问方式
@property(nonatomic,assign)DZQImgPickerStyle wayStyle;
//获取资源类型
@property(nonatomic,assign)DZQImgPickerModelType modelType;
//传入的控制器
@property(nonatomic,strong)UIViewController *controller;
//图片视频控制器核心对象
@property(nonatomic,strong)UIImagePickerController *imagePickerController;
//获取资源后的回调代码块
@property(nonatomic,copy)DZQImgPickerPicekerBlock pickerBlock;


@end

@implementation DZQImagePicker

-(void)pickerWithController:(UIViewController *)controller pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock{
    
    [self pickerWithController:controller wayStyle:DZQImgPickerFormIpc modelType:DZQImgPickerModelImage pickerBlock:^(DZQImgPickerStyle wayStyle, DZQImgPickerModelType modelType, id object) {
        pickerBlock(wayStyle,modelType,object);
    }];
}


-(void)pickerWithController:(UIViewController *)controller wayStyle:(DZQImgPickerStyle)wayStyle modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock{
    
    self.controller = controller;
    self.pickerBlock = pickerBlock;
    self.wayStyle = wayStyle;
    self.modelType = modelType;
    
}


-(void)getImagePickerWithAlertController:(UIViewController *)controller modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock{
    
    NSArray *alerts = @[@{DZQPickerWayGallery:@"相册"},
                        @{DZQPickerWayCamer:@"拍摄"}];
    [self getImagePickerWithAlertController:controller alerts:alerts modelType:modelType pickerBlock:^(DZQImgPickerStyle wayStyle, DZQImgPickerModelType modelType, id object) {
        pickerBlock(wayStyle,modelType,object);
    }];
}


-(void)getImagePickerWithAlertController:(UIViewController *)controller alerts:(NSArray *)alerts modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock{
    
    self.controller = controller;
    self.modelType = modelType;
    self.pickerBlock = pickerBlock;
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil            message:nil                                                                     preferredStyle:UIAlertControllerStyleActionSheet];
    
    for(int i=0;i<alerts.count;++i){
        
        NSDictionary * wayDic = alerts[i];
        NSString *wayKey = wayDic.allKeys[0];
        NSString *wayTitle = wayDic[wayKey];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:wayTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if([wayKey isEqualToString:DZQPickerWayFormIpc]){
                self.wayStyle = DZQImgPickerGallery;
                [self addImagePickerFromIpc:modelType];
            }else if ([wayKey isEqualToString:DZQPickerWayGallery]){
                self.wayStyle = DZQImgPickerGallery;
                [self addImagePickerFromIpc:modelType];
            }else{
                self.wayStyle = DZQImgPickerCamer;
                [self addImagePickerFromCamer:modelType];
            }
            
        }];
        
        [alertController addAction:action];
    }
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                             
    [self.controller presentViewController: alertController animated: YES completion: nil];
}



//通过摄像头获取资源
-(void)addImagePickerFromCamer:(DZQImgPickerModelType)modelType{
    
    if(![self isCameraAvailable]){
        KSLog(@"摄像头不可用");
        return;
    }
    
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.imagePickerController.allowsEditing = YES;
    
    //进入摄像头模式
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //录制视频时长，默认10s
    self.imagePickerController.videoMaximumDuration = 10;
    
    //视频上传质量
    self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    
    //可编辑
    self.imagePickerController.allowsEditing = YES;
    
    //显示照片
    if(modelType == DZQImgPickerModelImage){
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    }else if(modelType == DZQImgPickerModelVideo){
        //显示视频
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie];
    }else{
        //显示 照片+视频
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage,];
    }
    self.imagePickerController.modalPresentationStyle=UIModalPresentationOverFullScreen;
    [self.controller presentViewController:self.imagePickerController animated:YES completion:nil];
    
}



//通过相册访问资源
- (void)addImagePickerFromIpc:(DZQImgPickerModelType)modelType{
    
    if(![self isPhotoLibraryAvailable]){
        KSLog(@"相册不可用");
        return;
    }
    
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.imagePickerController.allowsEditing = NO;
    
    
    //访问相册
    if(self.wayStyle == DZQImgPickerFormIpc){
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        //访问图库
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    if(modelType == DZQImgPickerModelImage){
        self.imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.image", nil ,nil];
        
    }else if(modelType == DZQImgPickerModelVideo){
        self.imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil ,nil];
    }else{
        self.imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil ,nil];
    }
    self.imagePickerController.modalPresentationStyle=UIModalPresentationOverFullScreen;
    [self.controller presentViewController:self.imagePickerController animated:YES completion:nil];
}




#pragma  mark UIImagePickerControllerDelegate协议的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSString *mediaType = info[@"UIImagePickerControllerMediaType"];
    NSURL *imgUrl = info[@"UIImagePickerControllerImageURL"];
    NSString *imgString = [imgUrl absoluteString];
    NSArray *arr = [imgString componentsSeparatedByString:@"."];
    NSString *type = arr.lastObject;
    
    //获取到图片 判断是否裁剪
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
         //获取到gif图
        if([type isEqualToString:@"gif"]){
            self.modelType = DZQImgPickerModelGif;
            self.pickerBlock(self.wayStyle,self.modelType,imgUrl);
        }else{
            //获取普通图片
            self.modelType = DZQImgPickerModelImage;
            
            if(self.imagePickerController.editing == YES){
                [self saveImageAndUpdataHeader:[info objectForKey:UIImagePickerControllerEditedImage]];
            }else{
                [self saveImageAndUpdataHeader:[info objectForKey:UIImagePickerControllerOriginalImage]];
            }
        }
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        //获取到视频
        self.modelType = DZQImgPickerModelVideo;
        NSURL *url=[info objectForKey:UIImagePickerControllerMediaURL];
        NSString *urlPath=[url path];
        
        //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlPath)) {
            if(self.modelType != DZQImgPickerFormIpc && self.modelType != DZQImgPickerGallery){
                UISaveVideoAtPathToSavedPhotosAlbum(urlPath,self,@selector(video:didFinishSavingWithError:contextInfo:),nil);
            }else{
                if(self.pickerBlock){
                    self.pickerBlock(self.wayStyle,self.modelType,urlPath);
                }else{
                    self.pickerBlock = nil;
                }
            }
        }

    }
 
    [picker  dismissViewControllerAnimated:YES completion:nil];
}

//保存视频
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        KSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        KSLog(@"视频保存成功.");
        if(self.pickerBlock){
            self.pickerBlock(self.wayStyle,self.modelType,videoPath);
        }else{
            self.pickerBlock = nil;
        }
    }
}


//当用户取消时，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker  dismissViewControllerAnimated:YES completion:nil];
}


//拍照或者选取照片后的保存和刷新操作
-(void)saveImageAndUpdataHeader:(UIImage *)image{
    
    if(self.pickerBlock){
        self.pickerBlock(self.wayStyle,self.modelType,image);
    }else{
        self.pickerBlock = nil;
    }
}

//判断设备是否有摄像头
-(BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 前面的摄像头是否可用
-(BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

// 后面的摄像头是否可用
-(BOOL)isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

//相册是否可用
-(BOOL)isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

//是否可以在相册中选择视频
-(BOOL)canUserPickVideosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

//是否可以在相册中选择照片
-(BOOL)canUserPickPhotosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 判断是否支持某种多媒体类型：拍照，视频,
-(BOOL)cameraSupportsMedia:(NSString*)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result=NO;
    if ([paramMediaType length]==0) {
        KSLog(@"Media type is empty.");
        return NO;
    }
    NSArray*availableMediaTypes=[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}



//检查是否支持录像
-(BOOL)doesCameraSupportShootingVideos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中，
     然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeMovie'
     */
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
}

//检查摄像头是否支持拍照
-(BOOL)doesCameraSupportTakingPhotos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中，
     然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeImage'
     */
    
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}









@end
