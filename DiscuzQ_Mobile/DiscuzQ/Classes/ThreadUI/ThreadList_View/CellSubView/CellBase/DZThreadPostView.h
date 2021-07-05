//
//  DZThreadPostView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  包含一条帖子的 打赏，点赞 以及 最近三条评论

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadPostView : UIView

- (void)updateThreadPostView:(DZQDataThread *)Model;


@end

NS_ASSUME_NONNULL_END
