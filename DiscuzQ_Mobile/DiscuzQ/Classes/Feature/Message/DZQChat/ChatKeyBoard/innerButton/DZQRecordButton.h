//
//  DZQRecordButton.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DZQRecordButton;
@protocol DZQRecordButtonDelegate <NSObject>
@optional
//发送语音消息 (秒)
- (void)DZQRecordButtonBackAudio:(NSData *)voice time:(NSInteger)time;

@end

@interface DZQRecordButton : UIButton

- (instancetype)initWithSize:(CGSize)size delegate:(id)delegate;


@end

NS_ASSUME_NONNULL_END
