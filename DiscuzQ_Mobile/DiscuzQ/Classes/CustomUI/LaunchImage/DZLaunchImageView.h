//
//  DZLaunchImageView.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/5/25.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZLaunchImageView : UIImageView

@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, copy) void (^clickedImageURLHandle)(NSString *URLString);

@end
