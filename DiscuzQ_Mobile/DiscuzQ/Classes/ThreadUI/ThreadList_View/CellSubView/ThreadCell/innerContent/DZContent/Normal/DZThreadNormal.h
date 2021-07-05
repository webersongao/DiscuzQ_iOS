//
//  DZThreadNormal.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadNormal : UIView

- (void)updateThreadNormal:(DZQPostRelationV1 *)relateModel style:(DZDContentStyle *)localStyle;


@end

NS_ASSUME_NONNULL_END
