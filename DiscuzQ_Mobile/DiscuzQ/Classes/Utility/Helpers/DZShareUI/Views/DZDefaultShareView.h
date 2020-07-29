//
//  DZDefaultShareView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2016/12/21.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZShareModel;
@interface DZDefaultShareView : UIView

/**
 *  原生调起 分享页面
 */
+ (void)showDefaultShareViewFromModel:(DZShareModel *)model;

@end
