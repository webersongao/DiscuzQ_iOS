//
//  DZMediaCenter+ThreadList.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaCenter+ThreadList.h"
#import "DZThreadDetailController.h"


@implementation DZMediaCenter (ThreadList)

-(void)config_ListPlayer:(UIScrollView *)scrollView dataArray:(NSArray<DZQDataThread *> *)dataArray{
    
    self.dataArray = dataArray.copy;
    
    UINavigationController *topNavi = [DZMobileCtrl sharedCtrl].mainNavi;
    
    /// playerManager
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    
    /// player的tag值必须在cell里设置
    self.player = [DZMediaPlayer playerWithScrollView:scrollView playerManager:playerManager containerViewTag:kPlayerViewTag];
    self.player.controlView = self.controlView;
    /// 1.0是消失100%时候
    self.player.playerDisapperaPercent = 0.8;
    /// 播放器view露出一半时候开始播放
    self.player.shouldAutoPlay = NO;
//    self.player.playerApperaPercent = .5;
    KWEAKSELF
    self.player.playerDidToEnd = ^(id  _Nonnull asset) {
        [weakSelf.player stopCurrentPlayingCell];
        [weakSelf.videoView update_MediaState:dz_PlayNone];
    };
    
    self.player.playerPlayFailed = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset, id  _Nonnull error) {
        [weakSelf.videoView update_MediaState:dz_PlayRetry];
    };
    
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
        kAPPDelegate.allowOrentitaionRotation = isFullScreen;
        [topNavi.topViewController setNeedsStatusBarAppearanceUpdate];
        if (!isFullScreen) {
            /// 解决导航栏上移问题
            topNavi.navigationBar.zf_height = KNavigation_Bar_Height;
        }
        scrollView.scrollsToTop = !isFullScreen;
    };
    
    /// 停止的时候找出最合适的播放(只能找到设置了tag值cell)
    self.player.zf_scrollViewDidEndScrollingCallback = ^(NSIndexPath * _Nonnull indexPath) {
        if (!weakSelf.player.playingIndexPath) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
        }
    };

     
    /// 滑动中找到适合的就自动播放
    /// 如果是停止后再寻找播放可以忽略这个回调
    /// 如果在滑动中就要寻找到播放的indexPath，并且开始播放，那就要这样写
    self.player.zf_playerShouldPlayInScrollView = ^(NSIndexPath * _Nonnull indexPath) {
        if ([indexPath compare:weakSelf.player.playingIndexPath] != NSOrderedSame) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
        }
    };
    
    self.player.zf_playerDisappearingInScrollView = ^(NSIndexPath * _Nonnull indexPath, CGFloat playerDisapperaPercent) {
        BOOL isPlay = weakSelf.player.currentPlayerManager.isPlaying;
        [weakSelf.videoView update_MediaState:(isPlay ? dz_Playing : dz_PlayNone)];
    };
    
}

// 列表cell 播放视频
- (BOOL)Media_videoPlayWithIndexPath:(NSIndexPath *)indexPath playView:(DZMediaPlayView *)playView{
    
    self.videoView = playView;
    
    /// 如果正在播放的index和当前点击的index不同，则停止当前播放的index
    if (self.player.playingIndexPath != indexPath) {
        [self.player stopCurrentPlayingCell];
    }
    
    /// 如果没有播放，则点击进详情页会自动播放
    if (!self.player.currentPlayerManager.isPlaying) {
        [self playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
    }
    
    BOOL isPlay = self.player.currentPlayerManager.isPlaying;
    [playView update_MediaState:(isPlay ? dz_Playing : dz_PlayNone)];
    
    return isPlay;
}

// 列表cell 播放视频
- (BOOL)Media_videoPlayWithAssetURL:(NSString *)media_url playView:(DZMediaPlayView *)playView{
    
    self.videoView = playView;
    
    /// 如果正在播放的index和当前点击的index不同，则停止当前播放的index
    NSString *currentUrl = self.player.currentPlayerManager.assetURL.absoluteString;
    
    if (![currentUrl isEqualToString:media_url]) {
        [self.player stopCurrentPlayingView];
    }
    
    /// 如果没有播放，则点击进详情页会自动播放
    self.player.assetURL = KURLString(media_url);
    if (!self.player.currentPlayerManager.isPlaying) {
        [self.player playTheIndex:0];
    }
    
    BOOL isPlay = self.player.currentPlayerManager.isPlaying;
    [playView update_MediaState:(isPlay ? dz_Playing : dz_PlayNone)];
    
    return isPlay;
}

- (void)config_didSelectTableIndex:(NSIndexPath *)indexPath thread:(NSString *)threadId {
    
    /// 到详情页
    DZThreadDetailController *detailVC = [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:threadId];
    
    detailVC.player = self.player;
    KWEAKSELF
    /// 详情页返回的回调
    detailVC.detailVCPopCallback = ^{
        [weakSelf.player addPlayerViewToCell];
    };
    /// 详情页点击播放的回调
    detailVC.detailVCPlayCallback = ^(DZMediaPlayView *videoView) {
        [weakSelf playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
    };
    
}

- (void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath scrollAnimated:(BOOL)animated {
    
//    NSInteger index = (indexPath.row-1)/3;
    DZQThreadRelationV1 *videoModel = (DZQThreadRelationV1 *)self.dataArray[indexPath.row].relationships;
    
    if (animated) {
        [self.player playTheIndexPath:indexPath assetURL:[NSURL URLWithString:videoModel.threadVideo.attributes.media_url] scrollPosition:ZFPlayerScrollViewScrollPositionTop animated:YES];
    } else {
        [self.player playTheIndexPath:indexPath assetURL:[NSURL URLWithString:videoModel.threadVideo.attributes.media_url]];
    }
    
    [self.controlView showTitle:nil
                 coverURLString:videoModel.threadVideo.attributes.cover_url
                 fullScreenMode:ZFFullScreenModePortrait];
}


@end
