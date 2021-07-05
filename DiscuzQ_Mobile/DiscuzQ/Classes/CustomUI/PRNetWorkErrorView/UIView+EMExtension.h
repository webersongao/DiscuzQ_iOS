//
//  UIView+EMExtension.h
//  DiscuzQ
////
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EMExtension)

@property (nonatomic, assign) CGFloat dem_x;
@property (nonatomic, assign) CGFloat dem_y;
@property (nonatomic, assign) CGFloat dem_width;
@property (nonatomic, assign) CGFloat dem_height;
@property (nonatomic, assign) CGFloat dem_centerX;
@property (nonatomic, assign) CGFloat dem_centerY;
@property (nonatomic, assign) CGSize  dem_size;
@property (nonatomic, assign) CGPoint dem_origin;
@property (nonatomic, assign, readonly) CGFloat dem_maxX;
@property (nonatomic, assign, readonly) CGFloat dem_maxY;


@end

