//
//  DZBaseFloatingView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2017/7/27.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZBaseFloatingView : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *closeBtn;

- (void)show;

- (void)close;

@end
