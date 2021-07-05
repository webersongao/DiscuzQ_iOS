//
//  DZQRecordButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQRecordButton.h"
#import "DZQRecordHUD.h"
#import <AVFoundation/AVFoundation.h>

@interface DZQRecordButton ()<AVAudioRecorderDelegate>

@property(nonatomic,assign) NSInteger playTime;
@property(nonatomic,strong) NSURL  *audioCacheUrl;
@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) NSTimer         *playTimer;
@property (nonatomic, strong) AVAudioSession  *audioSession;
@property(nonatomic,assign)id<DZQRecordButtonDelegate>btnDelegate;

@end


@implementation DZQRecordButton


- (instancetype)initWithSize:(CGSize)size delegate:(id)delegate
{
    self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 3;
        self.btnDelegate = delegate;
        self.userInteractionEnabled = YES;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self setTitleColor:makeColorHex(@"#111111") forState:UIControlStateNormal];
        [self setTitle:@"按住 说话" forState:UIControlStateNormal];
        [self setTitle:@"松开 结束" forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(beginRecordVoice:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(endRecordVoice:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(cancelRecordVoice:) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchCancel];
        [self addTarget:self action:@selector(RemindDragExit:) forControlEvents:UIControlEventTouchDragExit];
        [self addTarget:self action:@selector(RemindDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
    }
    return self;
}



#pragma mark - 录音touch事件
- (void)beginRecordVoice:(UIButton *)button{
    
    _audioSession = [AVAudioSession sharedInstance];
    [_audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:nil];
    [_audioSession setActive:YES error:nil];
    
    NSDictionary *recordSetting = @{AVEncoderAudioQualityKey : [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderBitRateKey : [NSNumber numberWithInt:16],
                                    AVFormatIDKey : [NSNumber numberWithInt:kAudioFormatLinearPCM],
                                    AVNumberOfChannelsKey : @2,
                                    AVLinearPCMBitDepthKey : @8
    };
    NSError *error = nil;
    _recorder = [[AVAudioRecorder alloc] initWithURL:self.audioCacheUrl settings:recordSetting error:&error];
    if (error || !_recorder) {
        KSLog(@"recorder: %@ %zd %@", [error domain], [error code], [[error userInfo] description]);
        return;
    }
    _recorder.delegate = self;
    [_recorder prepareToRecord];
    _recorder.meteringEnabled = YES;
    
    if (!_audioSession.isInputAvailable) {
        return;
    }
    
    [_recorder record];
    _playTime = 0;
    _playTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countVoiceTime) userInfo:nil repeats:YES];
    [DZQRecordHUD show];
}

//录音结束
- (void)endRecordVoice:(UIButton *)button{
    [_recorder stop];
    [_playTimer invalidate];
    _playTimer = nil;
}

- (void)cancelRecordVoice:(UIButton *)button
{
    if (_playTimer) {
        [_recorder stop];
        [_recorder deleteRecording];
        [_playTimer invalidate];
        _playTimer = nil;
    }
    [DZQRecordHUD dismissWithError:@"Cancel"];
}

- (void)RemindDragExit:(UIButton *)button
{
    [DZQRecordHUD changeSubTitle:@"Release to cancel"];
}

- (void)RemindDragEnter:(UIButton *)button
{
    [DZQRecordHUD changeSubTitle:@"Slide up to cancel"];
}

- (void)countVoiceTime
{
    _playTime ++;
    if (_playTime>=59) {
        [self endRecordVoice:nil];
    }
}


#pragma mark - Mp3RecorderDelegate

//回调录音资料
- (void)endConvertWithData:(NSData *)voiceData
{
    if (self.btnDelegate && [self.btnDelegate respondsToSelector:@selector(DZQRecordButtonBackAudio:time:)]) {
        [self.btnDelegate DZQRecordButtonBackAudio:voiceData time:(self.playTime+1)];
    }
    
    [DZQRecordHUD dismissWithSuccess:@"Success"];
    
    //缓冲消失时间 (最好有block回调消失完成)
//    self.btnVoiceRecord.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.btnVoiceRecord.enabled = YES;
    });
}

- (void)failRecord
{
//    [DZQRecordHUD dismissWithSuccess:@"Too short"];
    
    //缓冲消失时间 (最好有block回调消失完成)
//    self.btnVoiceRecord.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.btnVoiceRecord.enabled = YES;
    });
}



#pragma mark - AVAudioRecorderDelegate 关闭活动 避免影响其他媒体
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    [_audioSession setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    NSError *err = nil;
    NSData *audioData = [NSData dataWithContentsOfFile:[self.audioCacheUrl path] options:0 error:&err];
    if (audioData) {
        [self endConvertWithData:audioData];
    }
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error{
    [_audioSession setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}





-(NSURL *)audioCacheUrl{
    if (!_audioCacheUrl) {
        NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        NSString * LocaclCachePath = [NSString stringWithFormat:@"%@/%@",cachePath,@"123"];
        _audioCacheUrl = [NSURL fileURLWithPath:LocaclCachePath];
    }
    return _audioCacheUrl;
}


@end

