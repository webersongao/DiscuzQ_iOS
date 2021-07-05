//
//  DZEditerDataHelper+Media.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZEditerDataHelper+Media.h"
#import "DZMediaPicker.h"

@implementation DZEditerDataHelper (Media)


-(void)media_PickerMutipleImage:(void (^)(NSArray<UIImage *> *imageArr, BOOL isOrigin))backImgBlock{
    
    [[DZMediaPicker Shared] dz_PickerToPickImage:DZPicker_MuitlplePic naviCtrl:[DZMobileCtrl sharedCtrl].mainNavi];
    [DZMediaPicker Shared].media_PictureBlock = ^(NSArray<UIImage *> *imageArr, NSArray<PHAsset *> *AssetArr, BOOL isOrigin) {
        KSLog(@"WBS 照片获取成功");
        if (backImgBlock) {
            backImgBlock(imageArr,isOrigin);
        }
    };
    
}






















@end



















