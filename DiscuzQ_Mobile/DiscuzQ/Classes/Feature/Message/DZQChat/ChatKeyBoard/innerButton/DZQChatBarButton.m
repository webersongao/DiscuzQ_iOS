//
//  DZQChatBarButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatBarButton.h"

@implementation DZQChatBarButton

+ (instancetype)BarButton:(CGSize)size tag:(NSInteger)tag img:(NSString *)img selImg:(NSString *)selImg Target:(nullable id)target action:(SEL)action
{
    DZQChatBarButton *button = [[DZQChatBarButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    button.tag  = tag;
    button.selected = NO;
    [button setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
