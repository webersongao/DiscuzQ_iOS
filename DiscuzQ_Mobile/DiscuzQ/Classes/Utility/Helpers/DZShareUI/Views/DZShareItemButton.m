//
//  DZShareItemButton.m
//  DiscuzQ
//
//  Created by WebersonGao on 2016/12/21.
//  Copyright © 2016年 Weberson. All rights reserved.
//
#import "DZShareItemButton.h"


@implementation DZShareItemButton

- (instancetype)initWithFrame:(CGRect)frame
                    ImageTag:(NSInteger)imageTAG
                        title:(NSString *)title
                    titleFont:(CGFloat)titleFont
                   titleColor:(UIColor *)titleColor

{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpShareButtonImageTag:imageTAG
                                  title:title
                              titleFont:titleFont
                             titleColor:titleColor];
    }
    return self;
}

- (void)setUpShareButtonImageTag:(NSInteger)imageTAG
                            title:(NSString *)title
                        titleFont:(CGFloat)titleFont
                       titleColor:(UIColor *)titleColor
{

    self.tag = imageTAG;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.width, 24)];
    label.textColor = titleColor;
    label.contentMode = UIViewContentModeScaleAspectFit;
    label.text = title;
    label.font = [UIFont systemFontOfSize:titleFont];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((self.width-40)/2,0,40,40);
}



@end
