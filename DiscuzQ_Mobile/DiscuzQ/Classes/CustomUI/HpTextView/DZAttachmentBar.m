//
//  DZAttachmentBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2017/6/6.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZAttachmentBar.h"

@implementation DZAttachmentBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commInit];
    }
    return self;
}

- (void)commInit {
    CGFloat btn_width = 34;
    self.imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imageBtn.frame = CGRectMake(15 , 5, btn_width, btn_width);
    [self.imageBtn setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [self addSubview:self.imageBtn];
}



@end
