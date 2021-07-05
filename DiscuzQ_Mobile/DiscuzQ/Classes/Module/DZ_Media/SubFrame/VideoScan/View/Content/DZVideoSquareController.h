//
//  DZVideoSquareController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/10.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "MediaHeader.h"

@interface DZVideoSquareController : DZBaseViewController

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) void(^didScrollAction)(UIScrollView *scrollView);  //!< 属性注释


@end
