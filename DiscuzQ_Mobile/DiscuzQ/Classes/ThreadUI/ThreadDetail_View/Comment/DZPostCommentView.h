//
//  DZPostCommentView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDPostCellStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZPostCommentView : UIView


-(void)updatePostComment:(DZQDataPost *)dataPost style:(DZDPostCellStyle *)postStyle;

@end

NS_ASSUME_NONNULL_END
