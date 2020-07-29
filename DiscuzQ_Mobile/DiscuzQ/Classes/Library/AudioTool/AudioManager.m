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
        [[AudioTool shareInstance] startRecord];
    };
    
    audioRecordView.recordTimeBlock = ^(NSInteger time) {
        [AudioTool shareInstance].recordTime = time;
    };
    
    __weak typeof(audioRecordView) weakAudioView = audioRecordView;
    audioRecordView.stopRecordBlock = ^{
        if ([AudioTool shareInstance].recordTime < 2) {
            [MBProgressHUD showInfo:@"录音时间太短"];
            KSLog(@"录音时间太短");
            [weakAudioView resetAction];
            return;
        }
        [[AudioTool shareInstance] stopRecord];
    };
    
    audioRecordView.playRecordBlock = ^{
        [[AudioTool shareInstance] playRecord];
    };
    
    audioRecordView.pausePlayBlock = ^{
        [[AudioTool shareInstance] pausePlayRecord];
    };
    
    audioRecordView.stopPlayBlock = ^{
        [[AudioTool shareInstance] stopRecord];
    };
    
    audioRecordView.sliderBlock = ^(float progress) {
        [[AudioTool shareInstance] sliderToPlay:progress];
    };
    
    audioRecordView.resetRecordBlock = ^{
        [[AudioTool shareInstance] resetRecord];
    };
    
}

+ (NSMutableArray *)upLoadAudioArray {
    return [AudioTool shareInstance].audioArray;
}

+ (void)clearAudio {
    [[AudioTool shareInstance] clearAudio];
}

+ (void)playWithUrl:(NSURL *)url {
    [[AudioTool shareInstance] playlistAudio:url];
}

+ (void)stopPlay {
    [[AudioTool shareInstance] stopPlayRecord];
}


@end
