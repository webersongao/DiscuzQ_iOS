//
//  DZQChatBarButton.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQRecordButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQChatBarButton : UIButton

+ (instancetype)BarButton:(CGSize)size tag:(NSInteger)tag img:(NSString *)img selImg:(NSString *)selImg Target:(nullable id)target action:(SEL)action;

@end




NS_ASSUME_NONNULL_END
