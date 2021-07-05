//
//  DZLaunchImageView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/5/25.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZLaunchImageView : UIImageView

@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, copy) void (^clickedImageURLHandle)(NSString *URLString);

@end
