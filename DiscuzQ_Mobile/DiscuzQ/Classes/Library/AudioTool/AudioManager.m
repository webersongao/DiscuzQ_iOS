//
//  AudioManager.m
//  audio
//
//  Created by WebersonGao on 2018/8/6.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "AudioManager.h"
#import "AudioTool.h"
#import "AudioRecordView.h"

@implementation AudioManager

+ (void)setAudioTool:(AudioRecordView *)audioRecordView {
    audioRecordView.startRecordBlock = ^{
        [[AudioTool Shared] startRecord];
    };
    
    audioRecordView.recordTimeBlock = ^(NSInteger time) {
        [AudioTool Shared].recordTime = time;
    };
    
    __weak typeof(audioRecordView) weakAudioView = audioRecordView;
    audioRecordView.stopRecordBlock = ^{
        if ([AudioTool Shared].recordTime < 2) {
            [MBProgressHUD showInfo:@"录音时间太短"];
            KSLog(@"录音时间太短");
            [weakAudioView resetAction];
            return;
        }
        [[AudioTool Shared] stopRecord];
    };
    
    audioRecordView.playRecordBlock = ^{
        [[AudioTool Shared] playRecord];
    };
    
    audioRecordView.pausePlayBlock = ^{
        [[AudioTool Shared] pausePlayRecord];
    };
    
    audioRecordView.stopPlayBlock = ^{
        [[AudioTool Shared] stopRecord];
    };
    
    audioRecordView.sliderBlock = ^(float progress) {
        [[AudioTool Shared] sliderToPlay:progress];
    };
    
    audioRecordView.resetRecordBlock = ^{
        [[AudioTool Shared] resetRecord];
    };
    
}

+ (NSMutableArray *)upLoadAudioArray {
    return [AudioTool Shared].audioArray;
}

+ (void)clearAudio {
    [[AudioTool Shared] clearAudio];
}

+ (void)playWithUrl:(NSURL *)url {
    [[AudioTool Shared] playlistAudio:url];
}

+ (void)stopPlay {
    [[AudioTool Shared] stopPlayRecord];
}


@end
