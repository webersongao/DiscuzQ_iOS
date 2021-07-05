//
//  UIView+DEAdd.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "UIView+SSAdd.h"

@implementation UIView (DEAdd)

//出场动画
+(void)animateIn:(UIView *)animateView
{
    animateView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.2 animations:^{
        animateView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.0/15.0 animations:^{
            animateView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1.0/7.5 animations:^{
                animateView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}


//入场动画
+(void)animateOut:(UIView *)animateView
{
    [UIView animateWithDuration:1.0/7.5 animations:^{
        animateView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0/15.0 animations:^{
            animateView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                animateView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            } completion:^(BOOL finished)
             {
                 [animateView removeFromSuperview];
             }];
        }];
    }];
}



//给按钮设置菊花展示
-(void)addActivityOnBtn{
    [self addActivityOnBtn:[UIColor whiteColor] scale:0.85];
}

-(void)addActivityOnBtn:(UIColor *)color scale:(CGFloat)scale{
    
    UIButton *button;
    if([self isKindOfClass:[UIButton class]]){
        button = (UIButton *)self;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    

    UIActivityIndicatorView *addFriendActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:button.bounds];
    [addFriendActivityIndicator setUserInteractionEnabled:YES];
    [addFriendActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [addFriendActivityIndicator setColor:color];
    [button addSubview:addFriendActivityIndicator];
    [addFriendActivityIndicator startAnimating];

    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    addFriendActivityIndicator.transform = transform;
    
}

//按钮菊花停止展示 并显示文字
-(void)closeActivityByBtn:(NSString *)title{
    
    if([self isKindOfClass:[UIButton class]]){
        UIButton *button = (UIButton *)self;
        button.titleLabel.hidden = NO;
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    for(UIView *view in self.subviews){
        if([view isKindOfClass:[UIActivityIndicatorView class]]){
            UIActivityIndicatorView *act = (UIActivityIndicatorView *)view;
            [act stopAnimating];
            [act removeFromSuperview];
            act = nil;
        }
    }
}





@end
