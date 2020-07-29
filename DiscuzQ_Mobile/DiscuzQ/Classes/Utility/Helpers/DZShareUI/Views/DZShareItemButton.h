//
//  DZShareItemButton.h
//  DiscuzQ
//
//  Created by WebersonGao on 2016/12/21.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZShareItemButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame
                     ImageTag:(NSInteger)imageTAG
                        title:(NSString *)title
                    titleFont:(CGFloat)titleFont
                   titleColor:(UIColor *)titleColor;
@end

