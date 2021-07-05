//
//  DZMediaCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZMediaPlayer.h"
#import "DZMediaPlayView.h"

@interface DZMediaCenter : NSObject

+(instancetype)Center;

@property (nonatomic,strong) DZMediaPlayer *player;  //!< 属性注释
@property (nonatomic, strong) ZFPlayerControlView *controlView;
@property (nonatomic, strong) DZMediaPlayView *videoView;

@property (nonatomic, strong) NSArray<NSURL *> *urls;  //!< 属性注释
@property (nonatomic, strong) NSArray<DZQDataThread *> *dataArray;  //!< 属性注释


@end


