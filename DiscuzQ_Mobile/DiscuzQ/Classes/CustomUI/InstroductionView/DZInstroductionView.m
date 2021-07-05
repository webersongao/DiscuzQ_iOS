//
//  DZInstroductionView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/19.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZInstroductionView.h"

@interface DZInstroductionView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation DZInstroductionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    self.pagingEnabled = YES;
    self.backgroundColor = KWhite_Color;
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
    
}

- (void)setPerpage:(NSMutableArray<UIImage *> *)imageArr {
    self.pageControl.numberOfPages = imageArr.count;
    self.contentSize = CGSizeMake(KScreenWidth * imageArr.count, KScreenHeight);
    for (int i = 0; i < imageArr.count; i ++ ) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * KScreenWidth, 0, KScreenWidth, KScreenHeight)];
        imgV.image= imageArr[i];
        if (i == imageArr.count - 1) {
            imgV.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [button addTarget:self action:@selector(hidInstroduction) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(KScreenWidth / 2 - 80, KScreenHeight - 105, 160, 50);
            [imgV addSubview:button];
            button.layer.borderColor = [UIColor redColor].CGColor;
            button.backgroundColor = [UIColor redColor];
            button.layer.borderWidth = 1.5;
            button.layer.cornerRadius = 10;
            [button setTitle:@"立即进入" forState:UIControlStateNormal];
            [button setTitleColor:KWhite_Color forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        }
        [self addSubview:imgV];
    }
    
}

- (void)hidInstroduction {
    if (self.dismissBlock) {
        self.dismissBlock();
    }
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
        self.pageControl.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.pageControl removeFromSuperview];
    }];
}

- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(KScreenWidth / 2 - 30, KScreenHeight - 40, 60, 30)];
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = KGreen_Color;
        [[[UIApplication sharedApplication].delegate window] addSubview:_pageControl];
    }
    return _pageControl;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / KScreenWidth);
}





@end
