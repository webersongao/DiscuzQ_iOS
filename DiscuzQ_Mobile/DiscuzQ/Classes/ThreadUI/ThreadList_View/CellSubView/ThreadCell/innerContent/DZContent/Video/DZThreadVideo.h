//
//  DZThreadVideo.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMediaPlayView.h"
#import "DZDDetailStyle.h"

@interface DZThreadVideo : UIView

@property (nonatomic, copy) backVideoBlock playBlock;

- (void)updateThreadVideo:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle;


@end

