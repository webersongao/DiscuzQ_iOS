//
//  TipInfoBgView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TipInfoBgView.h"

@interface TipInfoBgView ()
{
    UIImageView *m_imageView;
}
@end

@implementation TipInfoBgView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self adjustSubView];
    }
    return self;
}

- (void)adjustSubView
{
    CGRect rc = self.frame;
    rc.origin.x = 0;
    rc.origin.y = 0;
    rc.size.height = 3;

    m_imageView.frame = rc;
}


@end
