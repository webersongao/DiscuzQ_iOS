//
//  DZPostContentView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZPostContentView : UIView

- (void)updatePostContent:(DZQPostRelationV1 *)relateModel style:(DZDContentStyle *)localStyle;


@end

NS_ASSUME_NONNULL_END
