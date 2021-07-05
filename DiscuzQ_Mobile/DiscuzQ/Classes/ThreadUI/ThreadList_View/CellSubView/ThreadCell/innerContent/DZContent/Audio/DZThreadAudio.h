//
//  DZThreadAudio.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadAudio : UIView

@property (nonatomic, copy) backVideoBlock playBlock;

- (void)updateThreadAudio:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle;


@end

NS_ASSUME_NONNULL_END
