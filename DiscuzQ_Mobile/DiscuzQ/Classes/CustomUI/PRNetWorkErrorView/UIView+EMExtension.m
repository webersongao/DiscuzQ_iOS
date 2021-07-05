//
//  UIView+EMExtension.m
//  DiscuzQ
////
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "UIView+EMExtension.h"

@implementation UIView (EMExtension)

-(void)setDem_x:(CGFloat)dem_x{
    
    CGRect frame = self.frame;
    frame.origin.x = dem_x;
    self.frame = frame;
}

- (CGFloat)dem_x
{
    return self.frame.origin.x;
}

-(void)setDem_y:(CGFloat)dem_y{
    
    CGRect frame = self.frame;
    frame.origin.y = dem_y;
    self.frame = frame;
}

- (CGFloat)dem_y
{
    return self.frame.origin.y;
}

- (void)setDem_centerX:(CGFloat)dem_centerX{
    CGPoint center = self.center;
    center.x = dem_centerX;
    self.center = center;
}

- (CGFloat)dem_centerX
{
    return self.center.x;
}

- (void)setDem_centerY:(CGFloat)dem_centerY
{
    CGPoint center = self.center;
    center.y = dem_centerY;
    self.center = center;
}

- (CGFloat)dem_centerY
{
    return self.center.y;
}

- (void)setDem_width:(CGFloat)dem_width
{
    CGRect frame = self.frame;
    frame.size.width = dem_width;
    self.frame = frame;
}

- (CGFloat)dem_width
{
    return self.frame.size.width;
}

- (void)setDem_height:(CGFloat)dem_height
{
    CGRect frame = self.frame;
    frame.size.height = dem_height;
    self.frame = frame;
}

- (CGFloat)dem_height
{
    return self.frame.size.height;
}

-(void)setDem_size:(CGSize)dem_size
{
    CGRect frame = self.frame;
    frame.size = dem_size;
    self.frame = frame;
}

- (CGSize)dem_size
{
    return self.frame.size;
}

-(void)setDem_origin:(CGPoint)dem_origin
{
    CGRect frame = self.frame;
    frame.origin = dem_origin;
    self.frame = frame;
}

- (CGPoint)dem_origin
{
    return self.frame.origin;
}
- (CGFloat)dem_maxX{
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)dem_maxY{
    return self.frame.origin.y + self.frame.size.height;
}

@end

