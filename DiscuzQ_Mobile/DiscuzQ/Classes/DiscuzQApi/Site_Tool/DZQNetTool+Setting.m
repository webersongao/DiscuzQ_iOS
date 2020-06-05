//
//  DZQNetTool+Setting.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+Setting.h"


@implementation DZQNetTool (Setting)


/// TODO 上传站点Logo
/// 
/// @param logoType logo类型
//  1、logo 站点 logo （默认）
//  2、header_logo 站点头部 logo
//  3、background_image 站点背景图
-(void)dz_settingsLogoWithfile:(UIImage *)imageFile logoType:(NSString *)logoType success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    logoType = DZQStrNull(logoType);
    NSDictionary *paraDict = @{@"type":logoType.length ? logoType : @"logo"};
    [self.NetClient baidu_UploadRequestWithUrl:DZQ_Site_setlogo reponseType:PRResponseJson parameters:paraDict urlTag:0 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        NSData *fileData = [DZToolBox dz_getDataFromImage:imageFile];
        [formData appendPartWithFileData:fileData name:@"23253.png" fileName:@"123.jpeg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress *upProgress) {
        
    } success:^(NSURLSessionDataTask *task, id response) {
        if (success) {
            success(response,response ? YES : NO);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
}



@end
