//
//  DZThreadCashPayView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCashPayView : UIView

-(void)updateThreadPayView:(DZQDataThread *)Model payLayout:(DZDPayStyle *)layout;

@end

NS_ASSUME_NONNULL_END
