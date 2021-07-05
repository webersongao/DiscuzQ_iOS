//
//  DZSiriTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/14.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZSiriTool.h"
#import <AVFoundation/AVFoundation.h>
#import <Speech/Speech.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface DZSiriTool ()

@property (nonatomic, assign) BOOL isAuthed;  //!< 是否已经成功授权语音权限

@property (nonatomic, strong) AVAudioSession *session;

@property (nonatomic, strong) AVAudioEngine *audioEngine;

@property (nonatomic, strong) SFSpeechRecognizer *speechRecognizer;

@property (nonatomic, strong) SFSpeechAudioBufferRecognitionRequest *speechRequest;

@property (nonatomic, strong) AVAudioRecorder *recorder; // 录音

@property (nonatomic, strong) NSTimer *voiceTimer; // 录音音量计时器

@end

@implementation DZSiriTool

static DZSiriTool *instance = nil;

+(instancetype)sharedTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configRecorderStart];
        [self configSiriSpeechRecognizer];
    }
    return self;
}

- (void)configSiriSpeechRecognizer
{
    // 请求语音识别权限
    [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        self.isAuthed = (status == SFSpeechRecognizerAuthorizationStatusAuthorized) ? YES : NO;
    }];
    _session = [AVAudioSession sharedInstance];
    // 3各参数分别是 设置录音, 并且减少系统提供信号对应用程序输入和/或输出音频信号的影响,
    [_session setCategory:AVAudioSessionCategoryRecord mode:AVAudioSessionModeMeasurement options:AVAudioSessionCategoryOptionDuckOthers error:nil];
    [_session setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    
    // 初始化多媒体引擎
    [self launchSpeechAudioEngine];
}

- (void)launchSpeechAudioEngine
{
    if (!_speechRecognizer) {
        // 设置语言
        NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        _speechRecognizer = [[SFSpeechRecognizer alloc] initWithLocale:locale];
    }
    // 初始化引擎
    if (!_audioEngine) {
        _audioEngine = [[AVAudioEngine alloc] init];
    }
}

- (void)stardSpeechRecognizer:(void (^)(void))StatusBlock endBlock:(void (^)(NSString * String,BOOL isFinal))endBlock
{
    if (!self.isAuthed) {
        [self configSiriSpeechRecognizer];
        return;
    }
    // 创建新的语音识别请求
    [self PrepareSpeechRequest:endBlock];
    __weak typeof(self) weakSelf = self;
    // 录音格式配置 -- 监听输出流 并拼接流文件
    AVAudioFormat *recordingFormat = [[_audioEngine inputNode] outputFormatForBus:0];
    // 创建一个Tap,(创建前要先删除旧的)
    // 文档注释: Create a "tap" to record/monitor/observe the output of the node.
    [[_audioEngine inputNode] installTapOnBus:0 bufferSize:1024 format:recordingFormat block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        // 拼接流文件
        [strongSelf.speechRequest appendAudioPCMBuffer:buffer];
    }];
    
    // 准备并启动引擎
    [_audioEngine prepare];
    
    NSError *error = nil;
    // 启动引擎
    [_audioEngine startAndReturnError:&error];
    if (StatusBlock) {
        // 语音识别中...
        StatusBlock();
    }
}

//  创建语音识别请求
- (void)PrepareSpeechRequest:(void (^)(NSString * String,BOOL isFinal))endBlock
{
    if (_speechRequest) {
        [_speechRequest endAudio];
        _speechRequest = nil;
    }
    if (!endBlock) {
        return;
    }
    _speechRequest = [[SFSpeechAudioBufferRecognitionRequest alloc] init];
    _speechRequest.shouldReportPartialResults = YES; // 实时翻译
    // 建立语音识别任务, 并启动.  block内为语音识别结果回调
    [_speechRecognizer recognitionTaskWithRequest:_speechRequest resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        if (error) {
            KSLog(@"语音识别解析失败,%@",error);
            endBlock(nil,error);
        }else {
            // 识别的内容
            NSString *text = result.bestTranscription.formattedString;
            // 实时打印说话的内容
            KSLog(@"is final: %d  result: %@", result.isFinal, result.bestTranscription.formattedString);
            if (result.isFinal) { // 结束时 显示内容
                endBlock(text,nil);
                [self releaseSpeechEngine];
            }
        }
    }];
}

- (void)cancelSpeechRecognizer:(void (^)(void))StatusBlock{
    [self releaseSpeechEngine];
    if (StatusBlock) {
        StatusBlock();
    }
}

- (void)releaseSpeechEngine
{
    // 销毁tap
    [[_audioEngine inputNode] removeTapOnBus:0];
    
    [_audioEngine stop];
    
    [_speechRequest endAudio];
    _speechRequest = nil;
}

-(void)configRecorderStart{
//    https://www.jianshu.com/p/f4597bc61b3e
    NSMutableDictionary  *recorderDict = [NSMutableDictionary dictionary];
    // kAudioFormatMPEG4AAC ：xxx.acc；kAudioFormatLinearPCM ：xxx.caf
    [recorderDict setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [recorderDict setValue:[NSNumber numberWithInt:16000] forKey:AVSampleRateKey];
    
    self.recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:@"/Users/webersongao/Desktop/WechatIMG6.caf"] settings:recorderDict error:nil];
    // 开启音量检测
    self.recorder.meteringEnabled = YES;
    
    if (self.recorder)
    {
        // 录音时设置audioSession属性，否则不兼容Ios7
        AVAudioSession *recordSession = [AVAudioSession sharedInstance];
        [recordSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [recordSession setActive:YES error:nil];
        
        if ([self.recorder prepareToRecord])
        {
            [self.recorder record];
            [self startVoiceTimer];
        }
    }
}

// 停止录音
- (void)recorderStop
{
    if (self.recorder)
    {
        if ([self.recorder isRecording])
        {
            [self.recorder stop];
            
            // 停止录音后释放掉
            self.recorder.delegate = nil;
            self.recorder = nil;
        }
    }
    
    [self stopVoiceTimer];
}

// 开启音量检测
- (void)startVoiceTimer
{
    self.voiceTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(detectionVoice) userInfo:nil repeats: YES];
    [[NSRunLoop currentRunLoop] addTimer:self.voiceTimer forMode:NSRunLoopCommonModes];
    [self.voiceTimer setFireDate:[NSDate distantPast]];
    KSLog(@"开始检测音量");
}

// 停止音量检测
- (void)stopVoiceTimer
{
    if (self.voiceTimer)
    {
        [self.voiceTimer setFireDate:[NSDate distantFuture]];
        if ([self.voiceTimer isValid])
        {
            [self.voiceTimer invalidate];
        }
        self.voiceTimer = nil;
        KSLog(@"停止检测音量");
    }
}

// 显示音量
- (void)detectionVoice
{
    // 刷新音量数据
    [self.recorder updateMeters];
    
    //    // 获取音量的平均值
    //    [self.audioRecorder averagePowerForChannel:0];
    //    // 音量的最大值
    //    [self.audioRecorder peakPowerForChannel:0];
    
    double voice = pow(10, (0.05 * [self.recorder peakPowerForChannel:0]));
    KSLog(@"WBS voice音量大小: %f", voice);
}

@end
