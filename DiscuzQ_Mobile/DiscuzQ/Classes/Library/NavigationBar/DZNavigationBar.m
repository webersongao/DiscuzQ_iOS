//
//  DZNavigationBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZNavigationBar.h"
@implementation DZNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.naviLogo];
        [self addSubview:self.bottomLine];
    }
    return self;
}

-(UIButton *)leftButton{
    UINavigationItem *naviItem = self.items.firstObject;
    return naviItem.leftBarButtonItem.customView;
}

- (UIButton *)rightButton{
    UINavigationItem *naviItem = self.items.firstObject;
    return naviItem.rightBarButtonItem.customView;
}

-(UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-0.5, self.width, 0.5)];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}

-(UIImageView *)naviLogo{
    if (!_naviLogo) {
        _naviLogo = [[UIImageView alloc] initWithFrame:CGRectMake(100, self.height-39.f, self.width-200, 34.f)];
        _naviLogo.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _naviLogo;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //注意导航栏及状态栏高度适配
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    for (UIView *view in self.subviews) {
        if([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.frame = self.bounds;
        }else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            CGRect frame = view.frame;
            frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            view.frame = frame;
            for (UIView *subView in view.subviews) {
                if ([NSStringFromClass([subView class]) containsString:@"BarStackView"] && systemVersion >= 11.0) {
                    //                    view.layoutMargins = UIEdgeInsetsMake(view.layoutMargins.top, 8, view.layoutMargins.bottom, 8);
                }
            }
        }
    }
}

@end




