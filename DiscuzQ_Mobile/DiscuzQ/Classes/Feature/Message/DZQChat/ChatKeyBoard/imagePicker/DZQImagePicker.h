//
//  DZQImagePicker.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQChatKeyHeader.h"
#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface DZQImagePicker : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


/**
 默认访问通过相册方位 获取图片类型

 @param controller 传入的控制器对象
 @param pickerBlock 资源回调代码块
 */
-(void)pickerWithController:(UIViewController *)controller pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock;



/**
 通过相册和摄像头访问获取图片和视频资源

 @param controller 控制器对象
 @param wayStyle 访问方式
 @param modelType 资源类型
 @param pickerBlock 资源回调代码块
 */
-(void)pickerWithController:(UIViewController *)controller wayStyle:(DZQImgPickerStyle)wayStyle modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock;


/**
 直接加载系统的Alert弹窗来判断获取资源的方式 (相册 拍照)

 @param controller 控制器对象
 @param modelType 资源类型
 @param pickerBlock 资源回调代码块
 */
-(void)getImagePickerWithAlertController:(UIViewController *)controller modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock;




/**
 直接加载系统的Alert弹窗来判断获取资源的方式 (相册 拍照...)

 @param controller 控制器对象
 @param alerts 系统Alert对象
 @param modelType 资源类型
 @param pickerBlock 资源回调代码块
 */
-(void)getImagePickerWithAlertController:(UIViewController *)controller alerts:(NSArray *)alerts modelType:(DZQImgPickerModelType)modelType pickerBlock:(DZQImgPickerPicekerBlock)pickerBlock;






@end
