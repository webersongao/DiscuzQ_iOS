//
//  DZMediaCenter+ThreadList.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//
#import "DZMediaCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMediaCenter (ThreadList)

- (void)config_didSelectTableIndex:(NSIndexPath *)indexPath thread:(NSString *)threadId;

-(void)config_ListPlayer:(UIScrollView *)scrollView dataArray:(NSArray<DZQDataThread *> *)dataArray;


// 列表cell 播放视频
- (BOOL)Media_videoPlayWithIndexPath:(NSIndexPath *)indexPath playView:(DZMediaPlayView *)playView;

// 详情页 播放视频
- (BOOL)Media_videoPlayWithAssetURL:(NSString *)media_url playView:(DZMediaPlayView *)playView;

- (void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath scrollAnimated:(BOOL)animated;



@end

NS_ASSUME_NONNULL_END
