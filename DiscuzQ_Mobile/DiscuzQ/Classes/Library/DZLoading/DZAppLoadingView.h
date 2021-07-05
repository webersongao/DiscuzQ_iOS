//
//  DZAppLoadingView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DZAppLoadingView : NSObject


// 批量操作  状态浮层
+ (void)showStateWithTitle:(NSString *)StateTitle cancelTitle:(NSString *)cancelTitle Target:(id)target cancelAction:(SEL)cancelAction;
// 隐藏  状态浮层
+ (void)hiddenStateLoadingView;

@end
