//
//  DZQNetTool+Setting.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

@interface DZQNetTool (Setting)

/// TODO 上传站点Logo
///
/// @param logoType logo类型
//  1、logo 站点 logo （默认）
//  2、header_logo 站点头部 logo
//  3、background_image 站点背景图
-(void)dz_settingsLogoWithfile:(UIImage *)imageFile logoType:(NSString *)logoType success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end


