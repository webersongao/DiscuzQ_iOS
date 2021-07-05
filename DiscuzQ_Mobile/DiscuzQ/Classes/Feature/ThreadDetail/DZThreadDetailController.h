//
//  DZThreadDetailController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZThreadDetailController : DZBaseViewController

- (instancetype)initWithThread:(NSString *)thread_id;

@property (nonatomic,strong) DZMediaPlayer *player;  //!< 属性注释

/// Pop返回调用
@property (nonatomic, copy) void(^detailVCPopCallback)();

/// 点击播放调用
@property (nonatomic, copy) void(^detailVCPlayCallback)(DZMediaPlayView *videoView);


@end

