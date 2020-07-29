//
//  DZViewHelper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZViewHelper.h"

@implementation DZViewHelper

+(UIView *)lineView:(CGRect)frame{
    
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = KLine_Color;
    
    return line;
}


@end
